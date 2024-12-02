import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // Define your routes with go_router
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/task/:id',
        builder: (context, state) {
          // Get task ID from the path
          final taskId = state.params['id']!;
          return TaskScreen(taskId: taskId);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Task Navigation App',
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // List of tasks
  final List<String> tasks = [
    "Task 1: Learn Flutter",
    "Task 2: Build Navigation",
    "Task 3: Use go_router",
    "Task 4: Customize UI",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Navigation App'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final taskTitle = tasks[index];
          return ListTile(
            title: Text(taskTitle),
            onTap: () {
              // Navigate to the task screen using task ID (index)
              context.go('/task/$index');
            },
          );
        },
      ),
    );
  }
}

class TaskScreen extends StatelessWidget {
  final String taskId;

  const TaskScreen({Key? key, required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Center(
        child: Text(
          'You are viewing details for Task $taskId',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
