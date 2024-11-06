import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key, required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        title:  Text(taskModel.title ?? ""),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(taskModel.description ?? ""),
             Text(
              "Date:${taskModel.createdDate}",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label:  Text(taskModel.status ?? "New"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 11, vertical: 8),
                ),
                OverflowBar(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit),),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
