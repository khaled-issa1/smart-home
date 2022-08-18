import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/appservices/NavServices.dart';
import 'package:smart_home/backend/ProvideHelper.dart';
import 'package:smart_home/pages/CameraControlPage.dart';
import 'package:smart_home/pages/DoorControlPage.dart';
import 'package:smart_home/pages/FirebaseConnectionFail.dart';
import 'package:smart_home/pages/HomePage.dart';
import 'package:smart_home/pages/LightControlPage.dart';
import 'package:smart_home/pages/OnGoningPage.dart';
import 'package:smart_home/pages/SplashPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_home/pages/TempretureControlPage.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(Page1()));

}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return 
      ChangeNotifierProvider<ProvideHelper>(create: (context)=>ProvideHelper(),
        child:  MaterialApp(

          routes: {
            HomePage.routeName: (context)=>HomePage(),
            OnGoingPage.routeName: (context)=> OnGoingPage(),
            SplashPage.routeName: (context)=> SplashPage(),
            TempretureControlPage.routeName:(context)=> TempretureControlPage(),
            DoorControlPage.routeName:(context)=>DoorControlPage(),
            CameraControlPage.routeName:(context)=>CameraControlPage(),
            LightControlPage.routeName: (context)=> LightControlPage(),

          },
          navigatorKey: NavServices.navServices.navkey,
          debugShowCheckedModeBanner: false,
          title: 'smart home',
          home: FirebaseConnectionCheck(),
        ),

      );

  }
}

class FirebaseConnectionCheck extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return FirebaseConnectionFail();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return SplashPage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}


