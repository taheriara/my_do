import 'package:flutter/material.dart';
import 'package:my_do/models/task.dart';
import 'package:my_do/pages/add_task_page.dart';
import 'package:my_do/services/task_service.dart';
import 'package:shamsi_date/shamsi_date.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final textController = TextEditingController();
  String typeSelect = '';
  final _taskService = TaskService();
  List<Task> tasks = [];

  //create a task
  void CreateTask() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, StateSetter setState) => AlertDialog(
          content: Column(
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
            ],
          ),
          actions: [
            MaterialButton(
              child: Text('ثبت'),
              onPressed: () async {
                if (textController.text.isEmpty || typeSelect == '') return;
                Task newTask = Task(
                    title: textController.text,
                    type: typeSelect,
                    regDate: DateTime.now().toString(),
                    regDateFa: DateTime.now().toJalali().toString());
                await _taskService.saveTask(newTask);
                print('added--------');
                textController.clear();
                // Navigator.pop(context);
                tasks.add(newTask);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

// read Tasks
  Future fetchFromDb() async {
    tasks.clear();
    tasks.addAll(await _taskService.getUnDoneTasks());
    print('tasks: ${tasks.length.toString()}');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskPage()),
          );
          print('************past');
          await fetchFromDb();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return _box(id: task.id, title: task.title, leading: task.type, context: context);
        },
      ),
      //   itemBuilder: (context, index) => Text(tasks[index].title),
      // ),
    );
  }

  Widget _box({required id, required title, required leading, context}) {
    var icon;
    switch (leading) {
      case 'خانه':
        icon = Icons.home_outlined;
        break;
      case 'کار':
        icon = Icons.paid_outlined;
        break;
//مذهب
      default:
        icon = Icons.brightness_4_outlined;
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      // height: 80,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.blue.shade50),
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(title),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            print(id);
          },
        ),
        // subtitle: Text(subtitle),
      ),
    );
  }
}
