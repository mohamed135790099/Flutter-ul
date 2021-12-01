
import 'package:flutter/material.dart';
import 'package:flutter_ul/mycolor.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'InheritedWidgetAndContext',
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('InheritedWidgetAndContext'),),
      body:Center(
        child: MyColor(color: Colors.amber,child:Builder(
          builder:(BuildContext innerContext)=> Text('MyText',style:TextStyle(fontSize:45,backgroundColor:MyColor.of(innerContext).color),),
         ),
        ),
      )
    );
  }
}
