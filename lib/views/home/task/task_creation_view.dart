import 'package:flutter/material.dart';
import 'package:smarttaskmanager/model/task.dart';
import 'package:smarttaskmanager/services/api_service.dart';

class TaskCreationView extends StatefulWidget {
  const TaskCreationView({super.key});

  @override
  State<TaskCreationView> createState() => _TaskCreationViewState();
}

class _TaskCreationViewState extends State<TaskCreationView> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final ApiService _apiService = ApiService();

  bool _isLoading = false;

  void _createTask() async {
    setState(() => _isLoading = true);
    final task = Task(
      id: null,
      title: _titleController.text,
      content: _contentController.text,
    );

    try {
      await _apiService.createTask(task);
      Navigator.pop(context, true); // Optionally pass success flag
    } catch (e) {
      print('Failed to create task: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to create task')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Content'),
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _createTask,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
