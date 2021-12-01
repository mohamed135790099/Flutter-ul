import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'main.dart';



void main() {
  runApp(MainSplashScreen());
}
class MainSplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MainSplashScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Main Splash Screen',
      home:Scaffold(
        appBar:AppBar(title:Text('Main Splash Screen'),),
        body:Container(
          child: EasySplashScreen(
            title: Text(
              "Title",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.amber,
            logo: Image.asset('images/s2.jpg'),
            logoSize: 180,
            showLoader: true,
            loadingText: Text("Loading..."),
            durationInSeconds: 10,
           loadingTextPadding:EdgeInsets.all(60),
            navigator: MyApp(),
          ),
        )
      ),

    );
  }

}
