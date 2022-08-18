import 'package:flutter/material.dart';
import 'package:smart_home/appservices/NavServices.dart';
import 'package:smart_home/pages/SplashPage.dart';

class FirebaseConnectionFail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color:Colors.red,
        child: Center(
          child: TextButton(child: Text('click'),
          onPressed:(){
            NavServices.navServices.NavRep(SplashPage.routeName);

          }
            ,),
        ),
      ),
    );
  }
}
