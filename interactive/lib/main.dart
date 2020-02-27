import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      child:new Row(
        children:[ 
           new MyHomePage(),
        ]
      )
    );
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
      home: Scaffold(
          body:new Column(
        children:[
          titleSection,
          new TapboxA(),
          new ParentWidget(),
          new ParentWidgetC(),
        ]
      )
      )
    
    );
  }
}

class TapboxA  extends StatefulWidget {
  TapboxA ({Key key}) : super(key: key);  
  @override
  _TapboxAState createState() => _TapboxAState(); 
}
class _TapboxAState extends State<TapboxA>{
  bool _active = false;
  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }
  Widget build(BuildContext context){
return new GestureDetector(
  onTap:_handleTap,
  child:new Container(
    child:new Center(
      child:new Text(
        _active?'Active':'Inactive',
        style:new TextStyle(fontSize:32.0,color:Colors.white10)
      ),
    ),
    width:200.0,
    height:200.0,
    decoration: new BoxDecoration(
      color:_active?Colors.lightGreen[700]:Colors.grey[600],
    ),
  )
);
  }
}
class ParentWidget extends StatefulWidget{
  @override
  _ParentWidgetState createState() =>new _ParentWidgetState();
}
class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;
  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext content){
     return new Container(
       child:new TapboxB(
         active:_active,
         onChanged:_handleTapboxChanged
       )
     );
  }
}
class ParentWidgetC extends StatefulWidget{
  @override
  _ParentWidgetCState createState() =>new _ParentWidgetCState();
}
class _ParentWidgetCState extends State<ParentWidgetC>{
  bool _active = false;
  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext content){
     return new Container(
       child:new TapboxC(
         active:_active,
         onChanged:_handleTapboxChanged
       )
     );
  }
}
class TapboxB extends StatelessWidget{
  TapboxB({Key key,this.active:false,@required this.onChanged}):super(key:key);
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap(){
    onChanged(!active);
  }
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap:_handleTap,
      child:new Container(
        child:new Center(
          child:new Text(
            active?'Active':'Inactive',
            style:new TextStyle(fontSize: 32.0,color:Colors.white10)
          ),
        ),
        width:200.0,
        height:200.0,
        decoration:new BoxDecoration(
          color: active?Colors.lightGreen[700]:Colors.grey[600],
        ),
      ),
    );
  }
}
class TapboxC extends StatefulWidget{
  TapboxC({Key key,this.active:false,@required this.onChanged}):super(key:key);
  final bool active;
  final ValueChanged<bool> onChanged;
  _TapboxCState createState() => new _TapboxCState();
}
class _TapboxCState extends State<TapboxC>{
  bool _highlight = false;
  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }
  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }
  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }
  void _handleTap(){
    widget.onChanged(!widget.active);
  }
  Widget build(BuildContext context){
    return new GestureDetector(
       onTapDown: _handleTapDown, // Handle the tap events in the order that
      onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child:new Center(
          child:new Text(widget.active?'Active':'Inactive',
          style:new TextStyle(fontSize:32.0,color:Colors.white10)
          ),
        ),
        width:200.0,
        height:200.0,
        decoration: new BoxDecoration(
          color:widget.active?Colors.lightGreen[700]:Colors.grey[600],
          border:_highlight?new Border.all(
            color:Colors.teal[700],
            width:10.0
          ):null
        ),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
 
}

class _MyHomePageState extends State<MyHomePage> {
bool _isFavorited = true;
int _favoriteCount = 41;
void _toggleFavorite(){
  setState(() {
    if(_isFavorited){
      _favoriteCount -=1;
      _isFavorited = false;
    }else{
      _favoriteCount +=1;
      _isFavorited = true;
    }
  });
}
@override
Widget build(BuildContext context){
  return new Row(
          mainAxisSize: MainAxisSize.min,
          children:[
            new Container(
              padding:new EdgeInsets.all(0.0),
              child:new IconButton(
                icon:(
                  _isFavorited ? new Icon(Icons.star):new Icon(Icons.star_border)),
                  color:Colors.red[500],
                  onPressed:_toggleFavorite,
                ),
              ),  
            new SizedBox(
                width:18.0,
                child:new Container(
                  child:new Text('$_favoriteCount'),
                ),
              ),
              
          ],
        );
}
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() { 
  //     _counter++;
  //   });
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
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
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

