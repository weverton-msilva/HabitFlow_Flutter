import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, String>> _tasks = [
    {'titulo': 'Estudar Flutter', 'descricao': 'Praticar construção de layouts e estado.',},
  ];

  void _adicionarHabito() {
    String titulo = '';
    String descricao = '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Novo Hábito'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Título'),
              onChanged: (valor) => titulo = valor,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Descrição'),
              onChanged: (valor) => descricao = valor, 
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titulo.isNotEmpty) {
                setState(() => _tasks.add({'titulo': titulo, 'descricao': descricao}));
                Navigator.pop(context);
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.person_2, size: 32)),
        title: const Text('Metas do Dia', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_active_outlined, size: 28)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined, size: 28)),
        ],
      ),
      
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _tasks.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text('Seus Hábitos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF424242))),
            );
          }

          final task = _tasks[index - 1];
          return Card(
            elevation: 0,
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey.shade200)),
            child: ListTile(
              leading: Icon(Icons.bolt, color: Theme.of(context).colorScheme.primary),
              title: Text(task['titulo']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(task['descricao']!),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                onPressed: () => setState(() => _tasks.removeAt(index - 1)),
              ),
            ),
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarHabito,
        child: const Icon(Icons.add),
      ),
    );
  }
}
