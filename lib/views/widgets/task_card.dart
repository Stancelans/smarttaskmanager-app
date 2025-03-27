import 'package:flutter/material.dart';
import 'package:smarttaskmanager/constants/app_colors.dart';
import 'package:smarttaskmanager/model/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;

  const TaskCard({required this.task, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            Text(
              task.title ?? 'Untitled',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: wood_smoke,
              ),
            ),
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
    );
  }
}
