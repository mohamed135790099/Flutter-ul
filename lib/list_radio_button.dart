import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RadioListTile',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _groupvalue = 0;
  late String result;
  late String resultColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioListTile'),
      ),
      body: Container(
        padding:EdgeInsets.all(20),
        color:_groupvalue==0?Colors.brown:Colors.green,
        child: Column(
          children: [
            buildRadioListTile(0, "Brown", "Change BG to Brown"),
            buildRadioListTile(1, "Green", "Change BG to Green"),
          ],
        ),
      ),
    );
  }

  RadioListTile<dynamic> buildRadioListTile(
      int vale, String title, String subTitle) {
    return RadioListTile(
      value: vale,
      groupValue: _groupvalue,
      title:Text("$title"),
      subtitle:Text(subTitle,style:TextStyle(color:Colors.white),),
      controlAffinity : ListTileControlAffinity.trailing,
      onChanged: (value) {
        setState(() {
          _groupvalue = value;
          result = title;
          resultColor = subTitle;
        });
      },
    );
  }
}
