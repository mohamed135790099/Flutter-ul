import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'AlertDialog',
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
      appBar:AppBar(title:Text('AlertDialog'),),
      body:Center(
        child:RaisedButton(
          child:Text('Click Me!'),
          onPressed:(){
            buildDailog(context);
          },
        ),
      ),
    );
  }

  void buildDailog(BuildContext context) {
     final AlertDialog alert= AlertDialog(
      title:Text('Dialog Title'),
      content:Container(
        height:100,
        child:Column(
          children: [
            Divider(
              color:Colors.black,
            ),
            Text("This Dialog Text,Click Outside To Pop The Dialog !"),
            SizedBox(height:7,),
            SizedBox(
              height:30,
              width:double.infinity,
              child:RaisedButton(
                color: Colors.amber,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child:Text('Close !',style:TextStyle(color:Colors.white),),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            )

          ],
        ),

      ),
    );
    showDialog(context: context,barrierDismissible:false,barrierColor:Colors.blueGrey.withOpacity(0.5) ,builder:(BuildContext context){return alert;});
  }
}
