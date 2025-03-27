import 'package:flutter/material.dart';
import 'package:smarttaskmanager/views/app_base_view_model.dart';
import 'package:smarttaskmanager/model/task.dart';
import 'package:smarttaskmanager/services/api_service.dart';

class TaskTabViewModel extends AppBaseViewModel {
  final ApiService _apiService = ApiService();

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> initialize() async {
    debugPrint('TaskTabViewModel.initialize');

    try {
      final result = await _apiService.getTasks();
      _tasks = result;
      print('Fetched ${_tasks.length} tasks from server');
      notifyListeners();
    } catch (e) {
      print("Error fetching tasks: $e");
    }
  }
}
