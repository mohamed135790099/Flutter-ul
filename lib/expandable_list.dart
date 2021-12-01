import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Expandable List',
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
      appBar:AppBar(title:Text('Expandable List'),),
      body:buildExpansionTile(),

    );
  }
  ListView buildExpansionTile() {
    return ListView(
      children: [
        ExpansionTile(
          backgroundColor:Colors.purple,
          title: Text("Account"),
          leading:  Icon(Icons.account_circle_outlined),
          children: [
            Divider(color:Colors.brown,),
            Card(
              color:Colors.amber,
              child: ListTile(
                trailing:Icon(Icons.arrow_forward_ios),
                leading:Icon(Icons.add),
                title:Text('Sing UP !'),
                subtitle:Text('Where You Can Register An Account'),
                onTap:(){},
              ),
            ),
            Card(
              color:Colors.grey,
              child: ListTile(
                trailing:Icon(Icons.arrow_forward_ios),
                leading:Icon(Icons.account_circle),
                title:Text('Sing In !'),
                subtitle:Text('Where You Can Login With Your Account'),
                onTap:(){},
              ),
            ),

          ],

        ),
        SizedBox(height:10,),
        ExpansionTile(
          backgroundColor:Colors.lightGreen,
          title: Text("More Info"),
          leading:  Icon(Icons.message),
          children: [
            Card(
              color:Colors.white,
              child: ListTile(
                trailing:Icon(Icons.arrow_forward_ios),
                leading:Icon(Icons.phone),
                title:Text('Contact'),
                subtitle:Text('Where You Can Call Us'),
                onTap:(){},
              ),
            ),
          ],

        ),

      ],
    );
  }
}
