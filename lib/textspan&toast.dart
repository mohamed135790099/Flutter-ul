import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildFlatButton(context),
          ],
        ),
      ),
    );
  }

 FlatButton buildFlatButton(BuildContext context) {
    return FlatButton(
              onPressed: () {
                showToast(context);
              },
              child: buildRichText());
  }

  void showToast(BuildContext context) {
    Fluttertoast.showToast(
      msg:'Pink/Amber',
      toastLength:Toast.LENGTH_LONG,//
      // can use Toast Toast.LENGTH_LONG this duration will take 2s or Toast.LENGTH_SHORT this duration will take 1s as well as you can write duration by integer ex:duration:s
      backgroundColor:Colors.amber,
      textColor: Colors.pink,
      gravity:ToastGravity.CENTER,//you can control and change the place this toast will display it if you give gravity:0 this mean toast will display bottom,if you give gravity:1 or great than this mean toast will display center,if you give gravity:2 this mean toast will display top
    );
  }

  RichText buildRichText() {
    return RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text: "Pink",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink)),
                  TextSpan(
                      text: "/",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: "Amber",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber)),
                ],
              ));
  }
}
