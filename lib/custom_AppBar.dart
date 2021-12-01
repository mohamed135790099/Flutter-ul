import 'package:flutter/material.dart';

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
      body: Center(
       child:CustomScrollView(
         slivers: [
           SliverAppBar(
             pinned:true,
             snap:true,
             floating:true,
             expandedHeight:100,
             leading:Padding(
               padding:EdgeInsets.only(left:1),
               child:Row(
                 children: [
                   IconButton(onPressed: (){}, icon:Icon(Icons.account_circle)),
                   Expanded(child: IconButton(onPressed: (){}, icon:Icon(Icons.account_circle))),
                 ],
               ),
             ),
             actions: [
               IconButton(onPressed: (){}, icon:Icon(Icons.account_circle)),
               IconButton(onPressed: (){}, icon:Icon(Icons.account_circle)),
             ],
             flexibleSpace:Container(
               decoration:BoxDecoration(
                 gradient:LinearGradient(
                   colors:[
                     Colors.red,
                     Colors.white,
                     Colors.black,
                   ],
                 ),
               ),
             ),
             centerTitle:true,
             title: Text('Flutter Demo Home Page',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.pink ),textAlign:TextAlign.center,),
             backgroundColor:Colors.amber,
           ),
           SliverList(delegate:SliverChildListDelegate([
             // body content
           ]))
         ],

       ),
      ),
    );
  }

}