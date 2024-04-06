// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vms/home_page.dart';
import 'package:vms/register.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    loging();
    super.initState();
    }



  Future<void> loging() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var registerd = pref.getString("registerd");

    if (registerd == "true") {
      Future.delayed(const Duration(milliseconds: 4000), () {
      Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(title: '')
              // builder: (context) => Register()
               // builder: (context) =>Register()
                    
                    ));
      });
    } else {
      Future.delayed(const Duration(milliseconds: 4000), () {
       Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Register()
                // builder: (context) =>Register()
                    
                    ));
      });
    }
  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        // child: FlutterLogo(size: MediaQuery.of(context).size.height)
        // ignore: prefer_const_constructors
        child: Card(
          
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                shadowColor: Colors.white,
                elevation: 15,
          child: Container(
            width: 100,
            height: 100,
            child: Center(
              child: Text(
                "VMS",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.lightBlue),
              ),
              


            ),
          ),
        ),
      ),
    );
  }
}
