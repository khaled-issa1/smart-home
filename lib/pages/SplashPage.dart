import 'package:flutter/material.dart';
import 'package:smart_home/appservices/NavServices.dart';
import 'package:smart_home/pages/OnGoningPage.dart';

class SplashPage extends StatelessWidget {
  static String routeName='SplashPage';


  transferToNextPage()async{
    await Future.delayed(Duration(seconds: 3));
    NavServices.navServices.NavRep(OnGoingPage.routeName);

  }



  @override
  Widget build(BuildContext context) {
    transferToNextPage();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/shh.png'),
            fit: BoxFit.fill,
          )
        ),
      ) ,


    );
  }
}





