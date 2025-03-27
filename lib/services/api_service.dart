import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smarttaskmanager/model/task.dart';

class ApiService {
  static const String _baseUrl = 'https://smarttaskmanager-c6c8b4fee7cgbeas.uksouth-01.azurewebsites.net/api/v1/';

  /// GET all tasks
  Future<List<Task>> getTasks() async {
    final url = Uri.parse('$_baseUrl/tasks');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tasks: ${response.statusCode}');
    }
  }

  /// GET a single task by ID
  Future<Task> getTaskById(int id) async {
    final url = Uri.parse('$_baseUrl/tasks/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Task.fromJson(data);
    } else {
      throw Exception('Failed to load task: ${response.statusCode}');
    }
  }

  /// POST a new task
  Future<Task> createTask(Task task) async {
    final url = Uri.parse('$_baseUrl/tasks');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(task.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Task.fromJson(data);
    } else {
      throw Exception('Failed to create task: ${response.statusCode}');
    }
  }
}