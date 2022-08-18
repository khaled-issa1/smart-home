import 'package:flutter/material.dart';

class CameraControlPage extends StatelessWidget {
  static String routeName='CameraControlPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Camera Monitoring',style: TextStyle(color: Color.fromRGBO(21, 72, 84, 1)),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},color: Color.fromRGBO(21, 72, 84, 1),),
      ),

      body: Container(),
    );
  }
}
