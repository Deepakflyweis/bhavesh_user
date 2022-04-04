import 'package:dio/dio.dart';
import 'package:we_fast/api_provider/map_client.dart';

class PlaceEndPointProvider {
  Dio client;
  PlaceEndPointProvider({
    required this.client,
  });

  getPlace(String searchText) async {
    try {
      Response r = await client.get(
          "/place/textsearch/json?query=$searchText&key=${MapClient.googleMapApiKey}");
      if (r.statusCode == 200) {}
    } on Exception catch (e) {
      // TODO
    }
  }
}
