import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:smart_home/backend/FirebaseHelper.dart';


class DoorControlPage extends StatefulWidget {
  static String routeName='DoorControlPage';

  @override
  _DoorControlPageState createState() => _DoorControlPageState();
}

class _DoorControlPageState extends State<DoorControlPage> {
  bool sw1=false;
  getSw1Value()async{
    sw1= await FirebaseHelper.firebaseHelper.doorButtonValue();
  }
  @override
  void initState() {
    getSw1Value();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Door Control',style: TextStyle(color: Color.fromRGBO(21, 72, 84, 1)),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},color: Color.fromRGBO(21, 72, 84, 1),),
      ),

      body: Column(
        children: [
          SizedBox(height: 50,),

          Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(

                image: DecorationImage(image: AssetImage(sw1==true?'images/opendoor.png':'images/closedoor.png'),)
            ),


          ),

          SizedBox(height: 100,),


          FlutterSwitch(
            activeText: 'open',
            inactiveText: 'close',
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
              await FirebaseHelper.firebaseHelper.setDoor(sw1);
              setState(() {
                sw1=val;

              });
            },



          )

        ],
      ),


    );
  }
}
