import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'ShowFlashBar',
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
      appBar:AppBar(title:Text('SHOWFLASHBAR'),),
      body:Center(
        child:buildflushBar(context),
      ),
    );
  }

  RaisedButton buildflushBar(BuildContext context) {
    return RaisedButton(
        child:Text('Show FlashBar'),
        onPressed: () {
          Flushbar(
            mainButton:
            FlatButton(
              child:Text('Close!',style:TextStyle(color:Colors.red),),
              onPressed:(){
                Navigator.of(context).pop();
              },
            ),
            flushbarPosition: FlushbarPosition.TOP,
            duration:Duration(seconds:5),
            icon:Icon(Icons.info),
            backgroundColor:Colors.amber,
            title:'This Is Title', //text,
            messageText:Text('This Is Message',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white),),// widget
          ).show(context);
        },
      );
  }
}
