import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/backend/FirebaseHelper.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:smart_home/backend/ProvideHelper.dart';

class LightControlPage extends StatefulWidget {
  static String routeName='LightControlPage';

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  bool sw1=false;

  getSwValue()async{
    sw1= await FirebaseHelper.firebaseHelper.lightButtonValue();
  }

  @override
  void initState() {
    getSwValue();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Light Control',style: TextStyle(color: Color.fromRGBO(21, 72, 84, 1)),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},color: Color.fromRGBO(21, 72, 84, 1),),
      ),

      body:

       Column(
          children: [
            SizedBox(height: 50,),

            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(

                image: DecorationImage(image: sw1==true?AssetImage('images/onbulb.png'):AssetImage('images/bulb.png'),

                ),
              ),


            ),

            SizedBox(height: 100,),


            FlutterSwitch(
              duration: Duration(milliseconds: 1000),
              activeColor: Colors.green,
              inactiveColor: Colors.red,
              activeTextFontWeight: FontWeight.bold,
              inactiveTextFontWeight: FontWeight.bold,
              value: sw1,
              width: 180,
              height: 70,
              showOnOff: true,
              onToggle: (val)async{
                sw1=val;
                await FirebaseHelper.firebaseHelper.lightControl(sw1);
                setState(() {

                });


              },

            ),

          ],
        ),

    );
  }
}
