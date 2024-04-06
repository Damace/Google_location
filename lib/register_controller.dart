import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vms/points_model.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {




  // Future<void> register() async {
  //   if (firstNameController.text != "" ||
  //       lastNameController.text != "" ||
  //       emailController.text != "" ||
  //       passwordController.text != "") {
  //       firstNameController.clear();
  //       lastNameController.clear();
  //       emailController.clear();
  //       passwordController.clear(); 

  //     String url =
  //         "http://192.168.0.100/mkulimaKonekti/product/routes/routes.php/userReg";
  //     var response = await http.post(Uri.parse(url), body: {
  //       "first_name": firstNameController.text,
  //       "last_name": lastNameController.text,
  //       "email": emailController.text,
  //       "password": passwordController.text
  //     });

  //     if (response.statusCode == 200) {
  //       Get.toNamed(
  //         AppRoutes.formOtpScreen,
  //       );

  //       Get.snackbar(
  //         "Successfully Registered",
  //         "",
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Color.fromARGB(255, 35, 135, 40),
  //         colorText: Colors.white,
  //         icon: const Icon(Icons.error, color: Colors.white),
  //         shouldIconPulse: true,
  //         barBlur: 20,
  //       );
  //     } else {
  //       Get.snackbar(
  //         "Something went wrong",
  //         "",
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Colors.red.withOpacity(.2),
  //         colorText: Colors.white,
  //         icon: const Icon(Icons.error, color: Colors.white),
  //         shouldIconPulse: true,
  //         barBlur: 20,
  //       );
  //     }
  //   } else {
  //     Get.snackbar(
  //       "Error",
  //       "All fields are Required",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.red.withOpacity(.75),
  //       colorText: Colors.white,
  //       icon: const Icon(Icons.error, color: Colors.white),
  //       shouldIconPulse: true,
  //       barBlur: 20,
  //     );
  //   }
  // }
}
