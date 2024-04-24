import 'package:flutter/material.dart';

class TodoOnboarding extends StatelessWidget {
  const TodoOnboarding({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Todo App'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome to Todo App'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create-todo');
              },
              child: const Text('Create Todo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/all-todos');
              },
              child: const Text('All Todos'),
            ),
          ],
        ),
      ),
    );
  }
}
