import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute:   '/',
      routes: {
        '/': (context) => new MyHomePage(title: 'Flutter Demo Home Page'),
        //'/dispListView': (context) => new DispListView()
      }
    );
  }
}

class DispListView extends StatefulWidget {
  DispListView({Key key,this.text}) : super(key: key);
  final String text;

  @override
  _ListViewState createState() {
    debugPrint("called createState(listView)");
    return _ListViewState();
  }
}

class _ListViewState extends State<DispListView> {

  initState() {
    debugPrint("called initState,but do nothing");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("called build (listView)");
    var list = ["メッセージ",];

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.text),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index >= list.length) {
              list.addAll(["111",]);
            }
            return Container(
              decoration: new BoxDecoration(
                  border: new Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))
              ),
              child: ListTile(
                title: Text(
                  list[list.length - 1],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0
                  ),
                ),
              ),
            );
          },
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() {
    debugPrint("called createState");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  int counter = 0;
  TextEditingController textFieldController = new TextEditingController();
  // ignore: must_call_super
  initState(){
    this.counter = 0;
    debugPrint("called initState");
  }

  void _incrementCounter() {
    setState(() {
      counter++;
      debugPrint("called setState");
    });
  }
  void _initIncrement(){
    setState(() {
      debugPrint("called setState(counter0)");
      counter = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    debugPrint("called build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'カウントアップアプリの少し改変版。フロートボタンで相変わらず数が増えます。',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: const Text('カウント初期化'),
              color: Colors.red,
              shape: const StadiumBorder(),
              onPressed: _initIncrement,
            ),

            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: textFieldController,
                decoration: InputDecoration(
                    labelText: "次の画面のタイトルを入力",
                    hintText: "APPBarに表示されます。"),
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),

            RaisedButton(
              child: const Text('リストビューと値引き渡し'),
              color: Colors.redAccent,
              shape: const StadiumBorder(),
              onPressed: () => _sendDataTodispListView(context)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendDataTodispListView(BuildContext context){
    String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DispListView(text: textToSend),
        ));
  }
}
