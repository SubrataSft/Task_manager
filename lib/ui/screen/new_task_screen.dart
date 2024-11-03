import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/add_new_task_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/task_item.dart';
import 'package:task_manager/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            _buildSummarySection(),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return TaskItem();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddButton,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.themeColor,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapAddButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );
  }

  Widget _buildSummarySection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TaskSummaryCard(
            title: "New task",
            count: "34",
          ),
          TaskSummaryCard(
            title: "New task",
            count: "34",
          ),
          TaskSummaryCard(
            title: "New task",
            count: "34",
          ),
          TaskSummaryCard(
            title: "New task",
            count: "34",
          ),
        ],
      ),
    );
  }
}
