import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータを扱うStateウィジェット
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('タスク一覧'),
      ),
      body: ListView.builder(
        itemCount: todoList.length, //todoリストの個数を保持
        itemBuilder: (context, index) {
          //todoリストの文字列配列を元にCardを作成
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.library_add),
        onPressed: () async {
          final newListText = await Navigator.of(context).push(
            //pushで新規画面に遷移
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
          if (newListText != null) {
            //キャンセルすると newListTextが nullになることに注意
            setState(() {
              todoList.add(newListText);
            });
          }
        },
      ),
    );
  }
}

//リスト追加画面用Widget
class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  //入力されたテキストをデータとして持つ
  String _text = '';

  //データを元に表示するWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("タスクを追加"),
        leading: IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              //入力されたテキストの値を受け取る(valueが入力されたテキスト)
              onChanged: (String value) {
                setState(() {
                  //データを更新
                  _text = value;
                });
              },
            ),
            Container(
              width: double.infinity, //画面幅いっぱいにContainerを広げる
              //リスト追加ボタン
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop(_text); //popの引数から前の画面にデータを渡せる
                },
                child: Text("追加", style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              width: double.infinity, //画面幅いっぱいにContainerを広げる
              //キャンセルボタン(押すとリスト一覧画面に戻る)
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("キャンセル"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
