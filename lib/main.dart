import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //右上の赤いラベルの表示有無
      title: 'Todoアプリ',
      theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: TodoListPage(),
    );
  }
}

//リスト一覧画面用Widget
class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('リスト一覧画面'),
      ),
    );
  }
}
