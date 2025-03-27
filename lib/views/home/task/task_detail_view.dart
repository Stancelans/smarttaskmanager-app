import 'package:flutter/material.dart';
import 'package:smarttaskmanager/constants/app_colors.dart';
import 'package:smarttaskmanager/model/task.dart';

class TaskDetailView extends StatelessWidget {
  final Task task;
  const TaskDetailView({super.key, required this.task});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title ?? 'Task Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.all(24),
              decoration: ShapeDecoration(
                color: selago,
                shadows: [
                  BoxShadow(
                    color: wood_smoke.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  )
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: wood_smoke, width: 1.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title ?? 'Untitled',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    task.content ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: trout,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (task.notes != null && task.notes!.isNotEmpty) ...[
              const Text("Notes:", style: TextStyle(fontWeight: FontWeight.bold)),
              ...task.notes!.map((n) => ListTile(
                title: Text(n.content ?? ''),
                //subtitle: Text("Created: ${n.dateCreated?.toUtc()}"),
              )),
            ],
          ],
        ),
      ),
    );
  }
}
