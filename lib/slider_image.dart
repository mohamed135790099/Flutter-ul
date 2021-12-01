import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SliderImage',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndext=0;
  List imgList = ['images/s1.jpg', 'images/s2.jpg', 'images/s3.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderImage'),
      ),
      body: buildCarousel(),
    );
  }

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
}
