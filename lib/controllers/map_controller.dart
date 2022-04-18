import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast/api_provider/map_client.dart';
import 'package:we_fast/api_provider/map_providers/directions_endpoint.dart';
import 'package:we_fast/api_provider/map_providers/place_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:we_fast/models/directions_model.dart';
import 'package:we_fast/models/places_model.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> googleMapController = Completer();
  TextEditingController searchPickUp = TextEditingController();
  TextEditingController searchDrop = TextEditingController();
  RxList<PlacesModel> searchedPickupLocations = <PlacesModel>[].obs;
  RxList<PlacesModel> searchedDropLocations = <PlacesModel>[].obs;
  RxList<Marker> allMarkers = <Marker>[].obs;
  RxList<Polyline> polylines = <Polyline>[].obs;
  late Marker pickUpMarker;
  late Marker dropMarker;
  Rx<Routes?> selectedRoute = (null as Routes?).obs;
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
        PlaceEndPointProvider(mapClient: mapClient.init());
    placeEndPointProvider.getPlace(text).then((value) {
      placeList.clear();
      placeList.addAll(value);
      placeList.refresh();
    });
  }

  markDropLocation(PlacesModel placesModel) async {
    showDropList(false);
    dropPlace = placesModel;
    searchDrop.text = dropPlace!.formattedAddress;
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
    setPolylines(); //checks if both plces is selected and then set polylines
  }

  markPickUpLocation(PlacesModel placesModel) async {
    showPickupList(false);
    pickUpPlace = placesModel;
    searchPickUp.text = pickUpPlace!.formattedAddress;
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
    setPolylines(); //checks if both plces is selected and then set polylines
  }

  setPolylines() async {
    if (pickUpPlace != null && dropPlace != null) {
      MapClient mapClient = MapClient();
      DirectionsEndPointProvider directionsEndPointProvider =
          DirectionsEndPointProvider(mapClient: mapClient.init());
      directionsEndPointProvider
          .getDirections(
              originPlaceId: pickUpPlace!.placeId,
              destinationPlaceId: dropPlace!.placeId)
          .then((value) async {
        if (value.routes.isNotEmpty) {
          selectedRoute.value = value.routes.first;
          polylines.add(Polyline(
              geodesic: true,
              polylineId: const PolylineId("polyline0"),
              color: Colors.blue,
              width: 5,
              points: PolylinePoints()
                  .decodePolyline(value.routes.first.overviewPolyline.points)
                  .map((e) => LatLng(e.latitude, e.longitude))
                  .toList()));
          var gc = await googleMapController.future;
          gc.animateCamera(CameraUpdate.newLatLngBounds(
              LatLngBounds(
                  southwest: LatLng(value.routes.first.bounds.southwest.lat,
                      value.routes.first.bounds.southwest.lng),
                  northeast: LatLng(value.routes.first.bounds.northeast.lat,
                      value.routes.first.bounds.northeast.lng)),
              20.sp));
        }
        //just in case in future you had to implement multiple route
        /* for (int i = 0; i < value.routes.length; i++) {
          polylines.add(Polyline(
              polylineId: PolylineId("polyline$i"),
              color: i == 0 ? Colors.blue : Colors.grey,
              width: 2,
              points: PolylinePoints()
                  .decodePolyline(value.routes[i].overviewPolyline.points)
                  .map((e) => LatLng(e.latitude, e.longitude))
                  .toList()));
          var gc = await googleMapController.future;
          gc.animateCamera(CameraUpdate.newLatLngBounds(
              LatLngBounds(
                  southwest: LatLng(value.routes[i].bounds.southwest.lat,
                      value.routes[i].bounds.southwest.lng),
                  northeast: LatLng(value.routes[i].bounds.northeast.lat,
                      value.routes[i].bounds.northeast.lng)),
              5));
        } */
        polylines.refresh();
      });
    }
  }

  clearPickUpLocation() {
    searchPickUp.clear();
    searchedPickupLocations.clear();
    allMarkers
        .removeWhere((element) => element.markerId == const MarkerId("pickUp"));
    allMarkers.refresh();
    pickUpPlace = null;
    selectedRoute.value = null;
    showPickupList(false);
    polylines.clear();
    polylines.refresh();
  }

  clearDropLocation() {
    searchDrop.clear();
    searchedDropLocations.clear();
    allMarkers
        .removeWhere((element) => element.markerId == const MarkerId("drop"));
    allMarkers.refresh();
    dropPlace = null;
    selectedRoute.value = null;
    showDropList(false);
    polylines.clear();
    polylines.refresh();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
