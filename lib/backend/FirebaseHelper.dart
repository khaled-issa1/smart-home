import 'package:firebase_database/firebase_database.dart';

class FirebaseHelper {

  DatabaseReference database = FirebaseDatabase.instance.reference();

  FirebaseHelper._(){}

  static FirebaseHelper firebaseHelper = FirebaseHelper._();

  initlightRef() async {
    if (await database.child('light') == null) {
      await database.child('light');
    }
    else {

    }
  }

  initTempRef() async {
    if (await database.child('temp') == null) {
      await database.child('temp');
    }
    else {

    }
  }

  initDoorRef()async{
    if (await database.child('door') == null) {
      await database.child('door');
    }
    else {

    }

  }

  lightControl(bool a) async {
    initlightRef();
    await database.child('light').update({"button1": a});
  }

  lightButtonValue() async {
    DataSnapshot r = await database.child('light/button1').get();
    return r.value;
  }

  coolButtonValue() async {
    DataSnapshot r = await database.child('temp/cool').get();
    return r.value;
  }

  heatButtonValue() async {
    DataSnapshot r = await database.child('light/heat').get();
    return r.value;
  }

  doorButtonValue() async {
    DataSnapshot r = await database.child('door/status').get();
    return r.value;
  }

  setTemp(double a) async{
    initTempRef();
    await database.child('temp').update({'tempDegree':a});
  }

  Future<double> getTemp()async{
    DataSnapshot a= await database.child('temp/tempDegree').get();
    double x=double.parse(a.value.toString());
    return x;
  }

  TempVar({bool cool,bool heat})async{

    initTempRef();

    await database.child('temp').update({'cool':cool ,'heat':heat});



  }



  setDoor(bool t)async{
    initDoorRef();
    await database.child('door').update({'status':t});
  }





}



