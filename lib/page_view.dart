import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ul/main.dart';
import 'package:flutter_ul/main_splash_screen.dart';

class Date {
  final String title;
  final String descriPtion;
  final String imageUrl;
  final IconData icon;

  Date({
    required this.title,
    required this.descriPtion,
    required this.imageUrl,
    required this.icon,
  });
}

class PageViewHome extends StatefulWidget {
  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<PageViewHome> {
  final PageController _controller =PageController(
   initialPage:0,
  );
  int _currentIndex=0;

  List<Date> myDate = [
    Date(
        title: 'title1',
        descriPtion:
            'The native splash screen is displayed till Flutter renders the first frame of the application',
        imageUrl: 'images/q1.jpg',
        icon: Icons.airplanemode_on_outlined),
    Date(
        title: 'title2',
        descriPtion:
            'Defines standard behaviors when transitioning between routes or screens. Sometimes though a custom',
        imageUrl: 'images/q2.jpg',
        icon: Icons.attach_money),
    Date(
        title: 'title3',
        descriPtion:
            'Automatically generates android iOS and Web native code was originally created by Henrique Arthur',
        imageUrl: 'images/q3.jpg',
        icon: Icons.add_shopping_cart_rounded),
    Date(
      title: 'title4',
      descriPtion:
          'This package also contains a collection of Splash Screen example for your application to display ',
      imageUrl: 'images/q4.jpg',
      icon: Icons.account_box_outlined,
    ),
  ];

  void initState(){
    super.initState();
    Timer.periodic(Duration(seconds:1), (timer) {
      if(_currentIndex<3)_currentIndex++;
      _controller.animateToPage(_currentIndex, duration: Duration(seconds:1), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        'a/':(context)=>MyHomePageT(),
        'b/':(context)=>MainSplashScreen(),
      },
      title: 'Page View',
      home: Scaffold(
        body: Stack(
          children: [
            Builder(builder:(context)=>PageView(
              children: myDate
                  .map((item) => Container(
                decoration:BoxDecoration(
                  image: DecorationImage(
                    image:ExactAssetImage(item.imageUrl),
                    fit:BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            item.icon,
                            size: 120,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            item.title,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              item.descriPtion,
                              style: TextStyle(
                                  fontWeight:FontWeight.bold,
                                  fontSize: 28, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ).toList(),
              controller:_controller,
              onPageChanged:(val){
                setState(() {
                  _currentIndex=val;
                  if(_currentIndex==3){
                    Future.delayed(Duration(seconds:5),()=>Navigator.of(context).pushNamed('b/'));
                }
                });
              },
            ),
            ),
            Center(
                child: Indicator(_currentIndex),
            ),
           Builder(builder:(context)=> Align(
             alignment:Alignment(0,0.93),

             // width:double.infinity,
             // margin:EdgeInsets.only(top:550),
             child: Container(
               width:double.infinity,
               margin:EdgeInsets.symmetric(horizontal:15),
               child: RaisedButton(
                   padding:EdgeInsets.all(10),
                   color: Colors.amber,
                   child:Text('GET STARTED',style:TextStyle(fontSize:30,color:Colors.white),) ,
                   onPressed:() async {
                     SharedPreferences prefs = await SharedPreferences.getInstance();
                     prefs.setBool('x', true);
                     Navigator.of(context).pushNamed(
                         'b/'
                     );
                   }
               ),
             ),
           ),)
          ],
        ),
      ),
    );
  }
}
class Indicator extends StatelessWidget{
  final int index;
  Indicator(this.index);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Alignment(0,0.7),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          buildContainer(0,index==0?Colors.green:Colors.red),
          buildContainer(1,index==1?Colors.green:Colors.red),
          buildContainer(2,index==2?Colors.green:Colors.red),
          buildContainer(3,index==3?Colors.green:Colors.red),
        ],
      ),
    );
  }

  Widget buildContainer(int i,Color color) {
    return index==i?Icon(Icons.star):Container(
    margin:EdgeInsets.all(4) ,
    height:15,
    width:15,
    decoration:BoxDecoration(
      color:color,
      shape:BoxShape.circle,
    ),
  );
  }

}