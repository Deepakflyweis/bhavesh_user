import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_fast/essentails.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> googleMapController = Completer();
  TextEditingController pickUpController = TextEditingController();
  TextEditingController dropController = TextEditingController();
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void dispose() {
    super.dispose();
  }
}
