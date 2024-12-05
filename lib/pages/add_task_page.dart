import 'package:flutter/material.dart';
import 'package:my_do/models/task.dart';
import 'package:my_do/services/task_service.dart';
import 'package:shamsi_date/shamsi_date.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final textController = TextEditingController();
  String typeSelect = '';
  final _taskService = TaskService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                color: typeSelect == 'خانه' ? Colors.red : null,
                icon: Icon(
                  Icons.home_outlined,
                ),
                onPressed: () {
                  setState(() {
                    typeSelect = 'خانه';
                  });
                },
              ),
              // const SizedBox(width: 7),
              IconButton(
                icon: Icon(
                  color: typeSelect == 'کار' ? Colors.red : null,
                  Icons.paid_outlined,
                ),
                onPressed: () {
                  setState(() {
                    typeSelect = 'کار';
                  });
                },
              ),
              // const SizedBox(width: 7),
              IconButton(
                icon: Icon(
                  color: typeSelect == 'مذهب' ? Colors.red : null,
                  Icons.brightness_4_outlined,
                ),
                onPressed: () {
                  setState(() {
                    typeSelect = 'مذهب';
                  });
                },
              ),
            ],
          ),
          TextField(
            controller: textController,
          ),
          const SizedBox(height: 17),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (textController.text.isEmpty || typeSelect == '') return;
                        Task newTask = Task(
                            title: textController.text,
                            type: typeSelect,
                            regDate: DateTime.now().toString(),
                            regDateFa: DateTime.now().toJalali().toString());
                        await _taskService.saveTask(newTask);

                        setState(() {
                          textController.text = "";
                        });
                        // if (!context.mounted) return;
                        // Navigator.of(context).pop();
                      },
                      child: Text("ثبت")),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
