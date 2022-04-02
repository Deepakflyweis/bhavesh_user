import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/models/user_model.dart';

import '../api_provider/api_client.dart';
import '../api_provider/providers/user_endpoint.dart';

class ManageProfileController extends GetxController
    with StateMixin<UserModel> {
  TextEditingController name = TextEditingController();
  Rx<File> image = File("").obs;

  pickImage() async {
    ImagePicker picker = ImagePicker();
    var temp = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (temp != null) {
      await _cropImage(temp.path);
    }
  }

  _cropImage(filePath) async {
    ImageCropper imageCropper = ImageCropper();
    File? croppedImage = await imageCropper.cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
    if (croppedImage != null) {
      image.value = croppedImage;
    }
  }

  callGetUserApi() {
    Client client = Client();
    UserEndPointProvider userEndPointProvider =
        UserEndPointProvider(client: client.init());
    try {
      userEndPointProvider.getUserDetails().then((value) {
        change(value, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err));
      });
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    callGetUserApi();
    super.onInit();
  }
}
