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
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: '布局'),
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


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final titleText = Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ); 
    final subTitle = Text(
      'Pavlova is a meringue-based dessert named after the Russian ballerina ',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 18,
      ),
    );
     var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );
     final mainImage = Image.asset(
      'images/pavlova.jpg',
      width:125.0,
      height:180.0,
      fit: BoxFit.cover,
    );
    var packedRow = new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.black),
        new Icon(Icons.star, color: Colors.black),
      ],
    );
    var ratings = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black)
            ],
          ),
          new Text('170 Reviews',
              style: new TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 16.0))
        ],
      ),
    );
    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 14.0,
      height: 2.0,
    );
    var iconList = DefaultTextStyle.merge(
      style:descTextStyle,
      child:new Container(
        padding:new EdgeInsets.all(20.0),
        child:new Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children:[
            new Column(
               children:[
              new Icon(Icons.kitchen,color:Colors.green[500]),
              new Text('PREP:'),
              new Text('25 min'),
               ],
            ),
              new Column(
               children:[
              new Icon(Icons.timer,color:Colors.green[500]),
              new Text('COOK:'),
              new Text('1 hr'),
               ],
            ),
              new Column(
               children:[
              new Icon(Icons.restaurant,color:Colors.green[500]),
              new Text('FEEDS:'),
              new Text('4-6'),
               ],
            ),
          ],
        ),
      ),
    );
    var leftColumn = new Container(
      padding:new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        children:[
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:new Container(
        margin:new EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
        height:380.0,
        child:Card(
          child:new Center(
          child:new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            new Container(
              width:317.0,
              child:leftColumn,
            ),
            mainImage,
          ],
        ),
          ),
        ),
      ),
      // Center(
      //     child: new Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     new Expanded(
      //       child: new Image.asset('images/girl.jpg'),
      //     ),
      //     new Expanded(
      //       flex: 2,
      //       child: new Image.asset('images/food.jpg'),
      //     ),
      //     new Expanded(
      //       child: new Image.asset('images/girl.jpg'),
      //     )
      //   ],
      // )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
