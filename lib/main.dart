import 'package:demo_pachage/DetailedScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  int _counter = 0;
  List<String> abc=['aloo','mango','orange','whatermelon'];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(min: 0,max: 1,reverse: true);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Column(
          children: [
            Container(
              height: ScreenUtil().setHeight(210),
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Animated_horiwidget(index);
                  },),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Animated_widget(index);
                },),
            )
          ],
        ),
    );
  }

  Widget Animated_widget(int index) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => DetailedScreen(index,"images/${abc[index].toString()}.png")),
        );
      },
          child: Stack(
              alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(20),left: ScreenUtil().setHeight(20),right: ScreenUtil().setHeight(10)),
                  width:ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(130),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation:ScreenUtil().setHeight(10),
                  child: Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setHeight(50),right: ScreenUtil().setHeight(8)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mango',overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.black87,fontSize: 24,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                          SizedBox(height:ScreenUtil().setHeight(6) ,),
                          Text('Rs. 14.00/Kg',overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.orange,fontSize: 16,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        ],
                      ),
                  ),
                 ),),
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  // return Transform.rotate(angle: _controller.value * 2.0 * math.pi, child: child,);
                  return Transform.translate(
                    offset: Offset(0, 100 * _controller.value),
                    child: Hero(
                      tag: 'big${index}',
                      child: Container(
                        width: ScreenUtil().setHeight(50),
                        height: ScreenUtil().setHeight(50),
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(10),bottom:ScreenUtil().setHeight(10),left: ScreenUtil().setHeight(6) ),
                        child: Image.asset("images/${abc[index].toString()}.png"),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
  }

  Widget Animated_horiwidget(int index) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => DetailedScreen(index,"images/${abc[index].toString()}.png")),
        );
      },
      child: Container(
            padding: EdgeInsets.all(ScreenUtil().setHeight(6)),
            width:ScreenUtil().setHeight(150),
            height: ScreenUtil().setHeight(200),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation:ScreenUtil().setHeight(10),
              child: Container(
                margin: EdgeInsets.all( ScreenUtil().setHeight(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      child: Container(
                        margin: EdgeInsets.all( ScreenUtil().setHeight(10)),
                        alignment: Alignment.center,
                        child: Image.asset("images/${abc[index].toString()}.png"),
                      ),
                      builder: (BuildContext context, Widget? child) {
                        return Transform.rotate(angle: _controller.value * 2.0 * math.pi, child: child,);
                      },
                    ),
                    Text('Mango',overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.black87,fontSize: 24,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                    SizedBox(height:ScreenUtil().setHeight(6) ,),
                    Text('Rs. 14.00/Kg',overflow:TextOverflow.ellipsis,style: TextStyle(color: Colors.orange,fontSize: 16,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),),);
  }
}
