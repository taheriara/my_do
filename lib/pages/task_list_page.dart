import 'package:flutter/material.dart';
import 'package:my_do/models/task.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> with TickerProviderStateMixin {
  TextEditingController titleController = TextEditingController();
  int CurrentIndex = 0;
  late TabController _tabController;
  bool showDetails = false;
  String str = 'H E L L O';

  regTask(Task newTask) {
    print('registering task');
  }

  addTask(context) async {
    Task newTask = Task(title: '', category: 'کارهای من', regDate: DateTime.now().toString());
    showModalBottomSheet(
      
        context: context,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(builder: (context, StateSetter setState) {
              return Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: 12, right: 20, left: 20),
                // padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      style: TextStyle(fontSize: 16),
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'تکلیف جدید',
                      ),
                      onSubmitted: (value) {
                        if (value.isEmpty) return;

                        print('---->: $value');
                        newTask.title = value;
                        regTask(newTask);

                        Navigator.pop(context);
                        setState(() {
                          str = value ?? '-------------';
                        });
                      },
                    ),
                    showDetails
                        ? const TextField(
                            style: TextStyle(fontSize: 14),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'افزودن جزئیات',
                            ),
                          )
                        : Container(),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                showDetails = true;
                              });
                            },
                            icon: Icon(Icons.notes)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.schedule)),
                        IconButton(
                            onPressed: () {
                              newTask.favorite = true;
                            },
                            icon: Icon(Icons.star_border_outlined)),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              regTask(newTask);
                            },
                            child: Text('ذخیره')),
                      ],
                    )
                  ],
                ),
              );
            })).then((c) {
      if (titleController.text.isNotEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              //title: const Text('فایل صوتی حذف شود؟'),
              content: const Text(
                'از تکلیف فعلی صرف‌نظر شود؟',
                // style: TextStyle(
                //   fontFamily: 'Sahel FD',
                //   fontSize: 16,
                // ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('لغو'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('صرف‌نظر'),
                  onPressed: () async {
                    titleController.text = '';
                  },
                ),
              ],
            );
          },
        );

        // print('Hey there, I\'m calling after hide bottomSheet');
        // setState(() {
        //   str = 'is not empty';
        // });
      } else {
        // setState(() {
        //   str = 'I S   E M P T Y';
        // });
      }
      setState(() {
        str = 'WWWWWWWWW';
      });
    }).whenComplete(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('تکالیف'),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Menu Icon',
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                controller: _tabController,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.star,
                    ),
                  ),
                  Tab(
                    text: 'کارهای من',
                  ),
                  Tab(
                    text: 'برنامه‌ها',
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              // print('index: ${_tabController.index}');
              setState(() {
                showDetails = false;
              });
              await addTask(context).then((value) {
                setState(() {});
                print('--*-*-*-*-*-*-*-*-*-* ');
              });
              print('************************************************');
              setState(() {});
            },
            child: Icon(Icons.add),
          ),
          body: TabBarView(controller: _tabController, children: [
            // 1st tab
            Center(child: Text(str)),
            Center(child: Text('2st tab')),
            Center(child: Text('3st tab')),
          ]),
        ));
  }
}
