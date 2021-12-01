import 'package:flutter/material.dart';
import 'package:flutter_ul/page_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_splash_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? decision= prefs.getBool('x');
  Widget _screen=(decision==false||decision==null)?PageViewHome():MyApp();
  print(decision);
  runApp(_screen);
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
      home: MyHomePageT(),
    );
  }
}

class MyHomePageT extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageT> {
  int _currentIndext=0;
  List imgList = ['images/s1.jpg', 'images/s2.jpg', 'images/s3.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child:Container(
          alignment:Alignment.center,
          child: CustomScrollView(
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
                Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin:EdgeInsets.only(top:300),
                          alignment:Alignment.centerLeft,
                          child: Center(
                            child: buildflushBar(context),
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.only(top:300),
                          child: Center(
                            child:RaisedButton(
                              child:Text('Click Me!'),
                              onPressed:(){
                                buildDailog(context);
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.only(top:300),
                          child: buildFlatButton(context),

                        )
                      ],
                    ),
                  ],
                ),
                // body content
              ]))
            ],

          ),
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
      msg: 'Pink/Amber',
      toastLength:Toast.LENGTH_LONG,// can use Toast Toast.LENGTH_LONG this duration will take 2s or Toast.LENGTH_SHORT this duration will take 1s as well as you can write duration by integer ex:duration:s
      backgroundColor:Colors.amber,
      textColor: Colors.pink,
      gravity: ToastGravity.CENTER,
         //you can control and change the place this toast will display it if you give gravity:0 this mean toast will display bottom,if you give gravity:1 or great than this mean toast will display center,if you give gravity:2 this mean toast will display top
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
//alert Dialog
  void buildDailog(BuildContext context) {
    final AlertDialog alert= AlertDialog(
      title:Text('Dialog Title'),
      content:Container(
        height:100,
        child:Column(
          children: [
            Divider(
              color:Colors.black,
            ),
            Text("This Dialog Text,Click Outside To Pop The Dialog !"),
            SizedBox(height:7,),
            SizedBox(
              height:30,
              width:double.infinity,
              child:RaisedButton(
                color: Colors.amber,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child:Text('Close !',style:TextStyle(color:Colors.white),),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            )

          ],
        ),

      ),
    );
    showDialog(context: context,barrierDismissible:false,barrierColor:Colors.blueGrey.withOpacity(0.5) ,builder:(BuildContext context){return alert;});
  }

  //Flush Bar
  RaisedButton buildflushBar(BuildContext context) {
    return RaisedButton(
      child:Text('Show FlashBar'),
      onPressed: () {
        Flushbar(
          mainButton:
          FlatButton(
            child:Text('Close!',style:TextStyle(color:Colors.red),),
            onPressed:(){
              Navigator.of(context).pop();
            },
          ),
          flushbarPosition: FlushbarPosition.TOP,
          duration:Duration(seconds:5),
          icon:Icon(Icons.info),
          backgroundColor:Colors.amber,
          title:'This Is Title', //text,
          messageText:Text('This Is Message',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white),),// widget
        ).show(context);
      },
    );
  }
  //Carousel slider
  ListView buildCarousel() {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'slider 1:Initial page Index 0 \n\n',
          textAlign: TextAlign.center,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 186,
            initialPage: 0,
            enlargeCenterPage:true,
            autoPlay: true,
            autoPlayInterval:Duration(seconds:5),
            enableInfiniteScroll:true,
            pauseAutoPlayOnTouch:true,
            onPageChanged:(index,_){
              setState(() {
                _currentIndext=index;
              });
            },
            //reverse:true,
          ),
          items: imgList.map((imageUrl) {
            return Container(
              width: double.infinity,
              //margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
        ),
        SizedBox(height:30,),
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            buildContainer(0),
            buildContainer(1),
            buildContainer(2),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'slider 2:Initial page Index 1 \n\n',
          textAlign: TextAlign.center,
        ),
        CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder:( BuildContext context, int index, int realIndex){
            return Container(
              width: double.infinity,
              // margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(imgList[index], fit: BoxFit.cover,
              ),
            );
          },
          options:CarouselOptions(
            height: 186,
            initialPage: 1,
            enlargeCenterPage:true,
            autoPlay: true,
            autoPlayInterval:Duration(seconds:2),
            enableInfiniteScroll:false,
            reverse:true,
            pauseAutoPlayOnTouch:false,
            scrollDirection:Axis.vertical,
          ),
        )
      ],
    );
  }
  Container buildContainer(index) {
    return Container(
      height:10,
      width:10,
      margin:EdgeInsets.symmetric(horizontal:3),
      decoration:BoxDecoration(
        shape:BoxShape.circle,
        color:_currentIndext==index?Colors.red:Colors.black,
      ),
    );
  }



  Text buildText() {
    return Text(
            'You have pushed the button this many times:',
          );
  }
}
