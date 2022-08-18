import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/backend/FirebaseHelper.dart';

class ProvideHelper extends ChangeNotifier{

  bool lightStatus=false;
  bool coolStatus=false;
  bool heatStatus=false;
  bool doorStatus=false;



  getLightStatus()async{
    lightStatus= FirebaseHelper.firebaseHelper.lightButtonValue();
    notifyListeners();
  }

  getCoolStatus()async{
    lightStatus= FirebaseHelper.firebaseHelper.coolButtonValue();
    notifyListeners();
  }

  getHeatStatus()async{
    lightStatus= FirebaseHelper.firebaseHelper.heatButtonValue();
    notifyListeners();
  }

  getDoorStatus()async{
    lightStatus= FirebaseHelper.firebaseHelper.doorButtonValue();
    notifyListeners();
  }











}