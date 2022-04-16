import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_fast/api_provider/map_client.dart';
import 'package:we_fast/api_provider/map_providers/place_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:we_fast/models/places_model.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> googleMapController = Completer();
  TextEditingController searchPickUp = TextEditingController();
  TextEditingController searchDrop = TextEditingController();
  RxList<PlacesModel> searchedPickupLocations = <PlacesModel>[].obs;
  RxList<PlacesModel> searchedDropLocations = <PlacesModel>[].obs;
  RxList<Marker> allMarkers = <Marker>[].obs;
  late Marker pickUpMarker;
  late Marker dropMarker;
  PlacesModel? pickUpPlace;
  PlacesModel? dropPlace;
  RxBool showPickupList = false.obs;
  RxBool showDropList = false.obs;
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

  markDropLocation(PlacesModel placesModel) async {
    showDropList(false);
    dropPlace = placesModel;
    var latLong = LatLng(
        placesModel.geometry.location.lat, placesModel.geometry.location.lng);
    dropMarker = Marker(
      markerId: MarkerId("drop"),
      infoWindow: InfoWindow(title: "Drop Off"),
      position: latLong,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    );
    allMarkers.add(dropMarker);
    allMarkers.refresh();
    var mapc = await googleMapController.future;
    mapc.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: latLong,
      zoom: 14,
    )));
  }

  markPickUpLocation(PlacesModel placesModel) async {
    showPickupList(false);
    pickUpPlace = placesModel;
    var latLong = LatLng(
        placesModel.geometry.location.lat, placesModel.geometry.location.lng);
    pickUpMarker = Marker(
        markerId: MarkerId("pickUp"),
        position: latLong,
        infoWindow: InfoWindow(title: "Pick Up"));
    allMarkers.add(pickUpMarker);
    allMarkers.refresh();
    var mapc = await googleMapController.future;
    mapc.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLong, zoom: 14)));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
