import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vms/points_model.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  List<Users>users = <Users>[].obs;
  var markers = RxSet<Marker>();
  var isLoading = false.obs;

  static var client = http.Client();
  
  fetchUsers() async {
    try {
      isLoading(true);
      var response = await client.get(Uri.parse(
          'http://mkonekt.scienceontheweb.net/MkulimaKonekti/Controller/product/routes/routes.php/getusers'));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
           print(result);
        log(result.toString());
        users.addAll(RxList<Map<String, dynamic>>.from(result).map((e) => Users.fromJson(e)).toList());
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
     print('finally:$users');
      createMarkers();
    }
  }


    createMarkers() {
    users.forEach((element) {
      markers.add(
        Marker(
          markerId: MarkerId(element.title),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: LatLng(element.lat,element.lng),
          infoWindow:
              InfoWindow(title: element.title, snippet: element.phoneNumber.toString()),
              onTap: (){print('marker tapped');}
        ),
      );
    });
  }
}
