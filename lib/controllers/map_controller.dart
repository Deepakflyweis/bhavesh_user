import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_fast/api_provider/map_client.dart';
import 'package:we_fast/api_provider/map_providers/place_endpoint.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/models/places_model.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> googleMapController = Completer();
  TextEditingController searchPickUp = TextEditingController();
  TextEditingController searchDrop = TextEditingController();
  RxList<PlacesModel> searchedPickupLocations = <PlacesModel>[].obs;
  RxList<PlacesModel> searchedDropLocations = <PlacesModel>[].obs;
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  callGetPlacesApi(
      {required String text, required RxList<PlacesModel> placeList}) {
    MapClient mapClient = MapClient();
    PlaceEndPointProvider placeEndPointProvider =
        PlaceEndPointProvider(client: mapClient.init());
    placeEndPointProvider.getPlace(text).then((value) {
      placeList.clear();
      placeList.addAll(value);
      placeList.refresh();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
