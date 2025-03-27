class Note {
  int? id;
  String? content;
  DateTime? dateCreated;
  DateTime? lastUpdated;

  Note({
    required this.id,
    required this.content,
    this.dateCreated,
    this.lastUpdated,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      content: json['content'],
      dateCreated: json['dateCreated'] != null ? DateTime.parse(json['dateCreated']) : null,
      lastUpdated: json['lastUpdated'] != null ? DateTime.parse(json['lastUpdated']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'dateCreated': dateCreated?.toIso8601String(),
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Note{id: $id, content: $content}';
  }
}
