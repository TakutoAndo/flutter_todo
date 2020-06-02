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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            //pushで新規画面に遷移
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
        },
      ),
    );
  }
}

//リスト追加画面用Widget
class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop(); //pop()で前の画面に戻る
          },
          child: Text('リスト追加画面(タップで戻る)'),
        ),
      ),
    );
  }
}
