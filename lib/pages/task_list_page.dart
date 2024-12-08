import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> with TickerProviderStateMixin {
  int CurrentIndex = 0;
  late TabController _tabController;
  bool showDetails = false;

  addTask(context) {
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
                      style: TextStyle(fontSize: 16),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'تکلیف جدید',
                      ),
                    ),
                    showDetails
                        ? TextField(
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
                        IconButton(onPressed: () {}, icon: Icon(Icons.star_border_outlined)),
                        Spacer(),
                        TextButton(onPressed: () {}, child: Text('ذخیره')),
                      ],
                    )
                  ],
                ),
              );
            }));
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
              addTask(context);
            },
            child: Icon(Icons.add),
          ),
          body: TabBarView(controller: _tabController, children: [
            // 1st tab
            Center(child: Text('1st tab')),
            Center(child: Text('2st tab')),
            Center(child: Text('3st tab')),
          ]),
        ));
  }
}
