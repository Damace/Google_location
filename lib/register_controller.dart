import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vms/points_model.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  // void category() {
  //   Fluttertoast.showToast(
  //       msg: "${gender.text}",
  //       backgroundColor: const Color.fromARGB(255, 7, 93, 10),
  //       textColor: Colors.white);
  // }
    Future<Position> getPosition() async {
    bool servicesEnabled;
    LocationPermission permission;

    servicesEnabled = await Geolocator.isLocationServiceEnabled();
    if (!servicesEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("Location Service is Disabled.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permissions is Disabled.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location Permissions is Disabled.");
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> register() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var latitude = pref.getString("lat");
    var longitude = pref.getString("lng");

    try {
      String url =
          "http://mkonekt.scienceontheweb.net/MkulimaKonekti/Controller/product/routes/routes.php/mvsUser";
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "title": title.text,
          "first_name": firstName.text,
          "last_name": lastName.text,
          "email": email.text,
          "lat": latitude,
          "lng": longitude,
          "phone_number": phoneNumber.text,
          "password": password.text
        }),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Success Registerd",
            backgroundColor: const Color.fromARGB(255, 7, 93, 10),
            textColor: Colors.white);

        title.clear();
        firstName.clear();
        lastName.clear();
        email.clear();
        phoneNumber.clear();
        password.clear();
      } else {
        Get.snackbar(
          "Something went wrong",
          "",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(.2),
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: true,
          barBlur: 20,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
