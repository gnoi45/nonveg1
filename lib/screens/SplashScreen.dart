import 'package:fipola_app/screens/Pincode.dart';
import 'package:fipola_app/screens/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:fipola_app/screens/LoginPage.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

String x_id;
class _SplashScreenState extends State<SplashScreen> {

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      int status = preferences.getInt("status");
      x_id = preferences.getString("id");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    Future.delayed(Duration(
        seconds: 3,
    ),()
    {
      Navigator.pop(context);
      if (x_id == null || x_id.isEmpty) {
        Navigator.of(context).push(MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return new SignIn();
            }));
      } else if(x_id.isNotEmpty){
        Navigator.of(context).push(MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return new HomeScreen();
            }));
      }
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffbd100),
      body: Container(
        child: Center(
          child: Image(
            image: AssetImage('assets/logo.jpeg'),
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
