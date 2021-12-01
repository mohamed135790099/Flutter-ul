import 'package:flutter/material.dart';

void main() => runApp(MyAPP());

class MyAPP extends StatefulWidget {
  @override
  _MyAPPState createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  ThemeMode tm = ThemeMode.light;
  bool _SWval = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Mode',
      themeMode:tm,
      theme: ThemeData(primaryColor: Colors.brown, canvasColor: Colors.amber),
      darkTheme:ThemeData(primaryColor:Colors.purpleAccent,canvasColor:Colors.black),
      //darkTheme:ThemeData(primaryColor: Colors.deepOrange, canvasColor: Colors.pink),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ThemeMode'),
          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(Icons.light_mode),
                      Text('light'),
                    ],
                  )
                ),
                Switch(
                  value: _SWval,
                  onChanged: (value) {
                    setState(
                      () {
                        _SWval = value;
                        if(_SWval==false)tm=ThemeMode.light;
                        else tm=ThemeMode.dark;
                      },
                    );
                  },
                  activeColor: Colors.black,
                  inactiveTrackColor: Colors.white,
                ),

                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(Icons.dark_mode),
                      Text('dark'),
                    ],
                  )
                )
              ],
            ),
          ],
        ),
        body:null,

      ),
    );
  }
}
