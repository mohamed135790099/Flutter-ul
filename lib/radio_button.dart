import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RadioButton',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _radioValue;
  late String result;
  late Color resultColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioButton'),
      ),
      body: Column(
        children: [
          Text(
            'Guess The Answer: 2+2=?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.lightBlue,
            ),
          ),
          buildRadio(3,"Wrong Answer!",Colors.red),
          buildRadio(4,"Correct Answer!",Colors.green),
          buildRadio(5,"Wrong Answer!",Colors.red),


        ],
      ),
    );
  }
  myDialog(){
    var res=AlertDialog(
      content:Container(
        height:100,
        child: Column(
          children: [
            Text(result,style:TextStyle(color:resultColor),),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10),
              child:Text("Answer Is :4"),

            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder:(BuildContext context){
      return res;
    });

  }

  Row buildRadio(int val,String msg,Color restColor) {
    return Row(
      children: [
        Radio(
          value: val,
          groupValue: _radioValue,
          onChanged: (
            Object? value,
          ) {
            setState(() {
              _radioValue = value;
              result=msg;
              resultColor=restColor;
              myDialog();
            });

          },
        ),
        Text("$val"),
      ],
    );
  }
}
