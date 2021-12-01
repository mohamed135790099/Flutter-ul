
import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CheckBox',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool Js=false;
  bool Csharp=false;
  bool Java=false;
  bool Python=false;
String get txt {
    var str = "You Selected:\n";
    if (Js == true)
      str+='JavaScript\n';

    if (Java == true)
      str+='Java\n';

    if (Csharp == true)
       str+='C#\n' ;

    if (Python == true)
       str+='Python\n' ;

    else
      str+='None';

    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          //mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text('What\'s Your Favourite Language Programming ',style:TextStyle(fontWeight:FontWeight.bold,fontSize:16),),

           Row(
                //mainAxisAlignment:MainAxisAlignment.start,
                 children: [
                   Checkbox(
                     value: Js,
                     onChanged:(value){
                       setState(() {
                         Js=value!;
                       });
                     }
                     ,
                   ),
                   Text('JS'),
                 ],
              ),
           CheckboxListTile(value: Csharp, onChanged: (value){
          setState(() {
            Csharp=value!;
          });
        },
         controlAffinity:ListTileControlAffinity.leading,
          title:Text("C#"),
          subtitle: Text('very good language'),
        ),
           Row(
              //mainAxisAlignment:MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: Java,
                  onChanged:(value){
                    setState(() {
                      Java=value!;
                    });
                  }
                  ,
                ),
                Text('Java'),
              ],
            ),
           Row(
              //mainAxisAlignment:MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: Python,
                  onChanged:(value){
                    setState(() {
                      Python=value!;
                    });
                  }
                  ,
                ),
                Text('Python'),
              ],
            ),
          Center(child: RaisedButton(
            child:Text('Apply'),
              onPressed: (){
                var ad=AlertDialog(
              title:Text('Thank You for Applying'),
              content:Text(txt),
            );
            showDialog(context: context, builder:(BuildContext context){
              return ad;
            });
          }))
          ],
        ),
      ),
    );
  }
}
