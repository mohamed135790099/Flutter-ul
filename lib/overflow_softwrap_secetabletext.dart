import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'overflow',
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
        title: Text('OverFlow-SoftWrap-SelectableText'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectableText(
            'note that this Property used when you want not down new line',
            showCursor:true,
            cursorColor:Colors.black,
            cursorWidth:3,
            toolbarOptions:ToolbarOptions(
              copy:true,
              selectAll:true,
              paste:true,
              cut:true ,
            ),

          ),
          Container(
            color:Colors.green,
            height: 40,
            width: 200,
            child: Text(
              "This Is Clipped Text,This Is Clipped Text,This Is Clipped Text,This Is Clipped Text",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              overflow:TextOverflow.clip, // will be cut text if not match with container
              softWrap: false, // note that this Property used when you want not down new line
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            color:Colors.deepOrange,
            height: 40,
            width: 200,
            child: Text(
              "This Is Clipped Text,This Is Clipped Text,This Is Clipped Text,This Is Clipped Text",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              overflow:TextOverflow.ellipsis,// will be cut text if not match with container but will set three point prove that the text there more than text
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            color:Colors.purpleAccent,
            height: 40,
            width: 200,
            child: Text(
              "This Is Clipped Text,This Is Clipped Text,This Is Clipped Text,This Is Clipped Text",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              overflow:TextOverflow.fade,//will be cut text if not match with container but will display with fog
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            color:Colors.blue,
            height: 40,
            width: 200,
            child: Text(
              "This Is Clipped Text,This Is Clipped Text,This Is Clipped Text,This Is Clipped Text",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              overflow:TextOverflow.visible,// will display text full
            ),
          ),
        ],
      ),
    );
  }
}
