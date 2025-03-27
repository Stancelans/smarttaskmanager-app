import 'package:flutter/material.dart';
import 'package:smarttaskmanager/constants/app_colors.dart';
import 'package:smarttaskmanager/model/task.dart';
import 'package:smarttaskmanager/views/widgets/task_card.dart';
import 'package:stacked/stacked.dart';

import 'task_tab_view_model.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskTabViewModel>.reactive(
      viewModelBuilder: () => TaskTabViewModel(),
      onViewModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: athens_gray,
          body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            itemCount: model.tasks.length,
            itemBuilder: (context, index) {
              final Task task = model.tasks[index];
              return TaskCard(
                task: task,
                onTap: () {
                  model.navigateToTaskDetail(task);
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: persian_blue,
            onPressed: () {
              model.navigateToTaskCreation();
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        );
      },
    );
  }
}
