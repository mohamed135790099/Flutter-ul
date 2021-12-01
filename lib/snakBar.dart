import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Sank Bar',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _x=GlobalKey<ScaffoldState>();
  String str='SankBar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_x,
      appBar:AppBar(title:Text(str),),
      body:Container(
        alignment: Alignment.center,
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            RaisedButton(
              child:Text('Show SankBar'),
              onPressed: (){
                setState(() {
                  str='';
                });
                final snk=SnackBar(
                  action:SnackBarAction(
                    label:'undo!',
                    onPressed:(){
                      setState(() {
                        str='SankBar';
                      });

                    },
                  ),
                  content:Text('Sank Bar Text',textAlign:TextAlign.center,),
                  backgroundColor:Colors.red,
                  duration:Duration(seconds:3),
                  shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(60),
                  ),
                );
               // Scaffold.of(context).showSnackBar(snk);
                _x.currentState!.showSnackBar(snk);
              },
            )
          ],
        ),
      ),
    );
  }
}
