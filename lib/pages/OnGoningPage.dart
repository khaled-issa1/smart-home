
import 'package:flutter/material.dart';
import 'package:smart_home/appservices/NavServices.dart';
import 'package:smart_home/pages/HomePage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnGoingPage extends StatelessWidget {

  static String routeName='OnGoingPage';
  double w=300;
  double h=80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 100,),


          CarouselSlider(
              items: [
                Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('images/shh.png'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,
                Container(

                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('images/sh1.png'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,
                Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('images/sh2.jpg'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,

                Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('images/sh3.jpg'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,
              ]
              ,
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,

                scrollDirection: Axis.horizontal,
              )
          ),




          SizedBox(height: 50,),

          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),

            child: Text(
              'Welcome in Smart Home app \n\nControl lights, appliances, thermostats and other devices remotely using a smartphone or tablet through an internet connection',

              textAlign: TextAlign.center,
              style: TextStyle(color:Color.fromRGBO(21, 72, 84, 1),
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),

            ),),
          SizedBox(height: 30,),

          Container(

            width: double.infinity,

            margin: EdgeInsets.symmetric(vertical: 50
                ,horizontal: 30),

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(21, 72, 84, 1),
            ),
            child: TextButton(
              child: Text('Next',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: (){
                NavServices.navServices.NavPush(HomePage.routeName);
              },
            ),
          )




        ],
      ),
    );
  }
}
