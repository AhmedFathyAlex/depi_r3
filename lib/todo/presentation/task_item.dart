import 'package:depi_flutter/todo/data/task_model.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.task});
  final TaskModel task;
  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.title),
      subtitle: Text(widget.task.subtitle),
      leading: CircleAvatar(
        child: Text('${widget.task.date.month}/${widget.task.date.day}'),
      ),
      trailing: Checkbox(
        value: widget.task.isChecked,
        onChanged: (newValue) {
          setState(() {
            widget.task.isChecked = newValue ?? false;
          });
        },
      ),
    );
  }
}
