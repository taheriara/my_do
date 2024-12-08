import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:my_do/pages/home_page.dart';
import 'package:my_do/pages/task_list_page.dart';
import 'package:my_do/pages/tasks_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('fa', 'IR')],
      locale: const Locale("fa", "IR"),
      home: const TaskListPage(),
      theme: ThemeData(primaryColor: Colors.green[400]),
    );
  }
}
