import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: const Text("How are you"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Description will be here"),
            const Text(
              "Date:12/12/2024",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: const Text("New"),
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
