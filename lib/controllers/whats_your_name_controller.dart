import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_fast/api_provider/api_client.dart';
import 'package:we_fast/api_provider/providers/update_name_endpoint.dart';

class WhatsYourNameController extends GetxController {
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  String? namevalidator(value) {
    if (value == "") {
      return "Enter Valid Name";
    }
    return null;
  }

  checkName() {
    if (key.currentState!.validate()) {
      _callUpdateNameApi();
    }
  }

  _callUpdateNameApi() {
    Client client = Client();
    UpdateNameEndpointProvider updateNameEndpointProvider =
        UpdateNameEndpointProvider(client: client.init());
    updateNameEndpointProvider.updateName(name.text);
  }
}
