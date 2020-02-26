import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  var stack = new Stack(
    alignment: const Alignment(0.6, 0.6),
    children: [
      new CircleAvatar(
        backgroundImage:new AssetImage('images/pic1.jpg'),
        radius:100.0 
      ),
      new Container(
        decoration: new BoxDecoration(
          color:Colors.transparent,
        ),
        child: new Text(
          'Mia B',
          style:new TextStyle(
            fontSize:20.0,
            fontWeight:FontWeight.bold,
            color:Colors.black26,
          )
        ),
      )
    ],
  );
List<Container> _buildGridTitleList(int count){
  return new List<Container>.generate(count, (int index)=>new Container(child:new Image.asset('images/pic${index+1}.jpg')));
}
Widget buildGrid(){
  return new GridView.extent(
    maxCrossAxisExtent: 150.0,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children:_buildGridTitleList(4),
  );
}
  @override
  Widget build(BuildContext context) {
    var cardBox = new SizedBox(
      height:210.0,
      child:new Card(
        child:new Column(
          children: [
            new ListTile(
              title:new Text('1624 Main Street',
              style:new TextStyle(fontWeight: FontWeight.w500)),
              subtitle:new Text('My City,CA 99984'),
              leading:new Icon(
                Icons.restaurant_menu,
                color:Colors.blue[500]
              ),
              ),
              new Divider(),
              new ListTile(
                title:new Text('(408) 555-1212',style:new TextStyle(fontWeight:FontWeight.w500)),
                leading: new Icon(
                  Icons.contact_phone,
                  color:Colors.blue[500],
                ),
              ),
              new ListTile(
                title:new Text('consta@example.com'),
                leading:new Icon(
                  Icons.contact_mail,
                  color:Colors.blue[500],
                ),
              ),
            
          ],
        )
      )
    );
    var ContainerBox = new Container(
        decoration: new BoxDecoration(
          color: Colors.white10,
        ),
        child: new Column(children: [
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 8.0, color: Colors.green[100]),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/girl1.jpg'),
                ),
              ),
              new Expanded(
                  child: new Container(
                      decoration: new BoxDecoration(
                        border:
                            new Border.all(width: 8.0, color: Colors.green[100]),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: new Image.asset('images/girl2.jpg'))),
              new Expanded(
                  child: new Container(
                      decoration: new BoxDecoration(
                        border:
                            new Border.all(width: 8.0, color: Colors.green[100]),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: new Image.asset('images/girl3.jpg'))),
              new Expanded(
                  child: new Container(
                      decoration: new BoxDecoration(
                        border:
                            new Border.all(width: 8.0, color: Colors.green[100]),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8.0)),
                      ),
                      margin: const EdgeInsets.all(4.0),
                      child: new Image.asset('images/flower.jpg')))
            ],
          )
        ]));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:new Column(
          children: [
             stack,
             cardBox,
             ContainerBox
          ]
        ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
