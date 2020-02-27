import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new LogoApp());

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: child),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
        child: new Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        child: new FlutterLogo(),
      ),
    ),
        // child: new Container(
        //   margin: new EdgeInsets.symmetric(vertical: 10.0),
        //   height: animation.value,
        //   width: animation.value,
        //   child: new FlutterLogo(),
        // ),
        );
  }
}

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    // animation = new Tween(begin:0.0,end:300.0).animate(controller)..addListener((){
    //   setState(() {

    //   });
    // });
    // animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    // final CurvedAnimation curve =
    //     new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    // animation = new Tween(begin: 0.0, end: 300.0).animate(curve);
    animation =  new CurvedAnimation(parent: controller, curve: Curves.easeIn); 
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  Widget build(BuildContext context) {
     return new AnimatedLogo(animation: animation);
    // return new AnimatedLogo(animation: animation);
    // return new GrowTransition(child: new LogoWidget(), animation: animation);
  }

  // Widget build(BuildContext context){
  //   return new Center(
  //     child:new Container(
  //       margin:new EdgeInsets.symmetric(vertical:10.0),
  //       height:animation.value,
  //       width:animation.value,
  //       child:new FlutterLogo(),
  //     ),
  //   );
  // }
  dispose() {
    controller.dispose();
    super.dispose();
  }
}
