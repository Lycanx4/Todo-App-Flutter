import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.taskTitle, required this.isChecked, required this.toggleCheckboxState});

  final String taskTitle;
  final bool isChecked;
  final ValueChanged<bool?>? toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,
      style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough: null),),
      trailing: Checkbox(
          value: isChecked,
          fillColor: MaterialStateColor.resolveWith((states) => Colors.lightBlueAccent),
          onChanged: toggleCheckboxState,
      ),
    );
  }
}