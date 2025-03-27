import 'note.dart';

class Task {
  int? id;
  String? title;
  String? content;
  String? taskStatus;
  int? userId;
  DateTime? dateDue;
  DateTime? dateStarted;
  DateTime? dateEnded;
  DateTime? dateCreated;
  DateTime? lastUpdated;
  List<Note>? notes;

  Task({
    required this.id,
    required this.title,
    required this.content,
    this.taskStatus,
    this.userId,
    this.dateDue,
    this.dateStarted,
    this.dateEnded,
    this.dateCreated,
    this.lastUpdated,
    this.notes,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      taskStatus: json['taskStatus'],
      userId: json['userId'],
      dateDue: json['dateDue'] != null ? DateTime.parse(json['dateDue']) : null,
      dateStarted: json['dateStarted'] != null ? DateTime.parse(json['dateStarted']) : null,
      dateEnded: json['dateEnded'] != null ? DateTime.parse(json['dateEnded']) : null,
      dateCreated: json['dateCreated'] != null ? DateTime.parse(json['dateCreated']) : null,
      lastUpdated: json['lastUpdated'] != null ? DateTime.parse(json['lastUpdated']) : null,
      notes: (json['notes'] as List<dynamic>?)
          ?.map((noteJson) => Note.fromJson(noteJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'taskStatus': taskStatus,
      'userId': userId,
      'dateDue': dateDue?.toIso8601String(),
      'dateStarted': dateStarted?.toIso8601String(),
      'dateEnded': dateEnded?.toIso8601String(),
      'dateCreated': dateCreated?.toIso8601String(),
      'lastUpdated': lastUpdated?.toIso8601String(),
      'notes': notes?.map((n) => n.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, title: $title, content: $content, notes: $notes}';
  }
}
