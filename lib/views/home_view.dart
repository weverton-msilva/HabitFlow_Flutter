import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> _habits = ['Beber água 💧', 'Estudar Flutter 💻'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: Theme.of(context).colorScheme.primary,

        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.person_2, size: 32),
        ),

        title: const Text(
          'Metas do Dia',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_outlined, size: 28, color: const Color(0xFF424242)),
          ),
        ],
      ),
    );
  }
}
