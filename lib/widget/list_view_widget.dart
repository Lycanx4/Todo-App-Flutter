import 'package:flutter/material.dart';
import 'package:todoey/widget/task_view_widget.dart';

import '../model/task.dart';
import '../presentations/tasks_screen.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  List<Task> tasksLocal = [];

  @override
  void initState() {
    tasksLocal = widget.tasks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasksLocal.length,
      itemBuilder: (context, int index) {
        return Dismissible(
          key: Key(tasksLocal[index].name!),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          onDismissed: (dir) {
            tasksLocal.removeAt(index);
          },
          child: TaskTile(
            taskTitle: tasksLocal[index].name!,
            isChecked: tasksLocal[index].isDone,
            toggleCheckboxState: (val) {
              setState(() {
                tasks[index].toggleDone();
              });

              // tasks.removeAt(index);
            },
          ),
        );
      },
    );
  }
}
