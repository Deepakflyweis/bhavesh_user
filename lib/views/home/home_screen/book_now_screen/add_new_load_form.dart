import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/constants/enums.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/models/goods_model.dart';
import 'package:we_fast/services/weight_converter.dart';
import 'package:we_fast/widgets/buttons/rectangular_gradient_button.dart';
import 'package:we_fast/widgets/dotted_line.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';

class AddNewLoadForm extends StatelessWidget {
  AddNewLoadForm({Key? key}) : super(key: key);
  final BookVehicleController bookVehicleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const DrawerAppBar(title: 'Add New Load'),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PhysicalModel(
                color: Colors.white,
                elevation: 3,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Form(
                        key: bookVehicleController.addNewLoadFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SENDER\'S INFORMATION',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Divider(
                              height: 1.h,
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            TextFormField(
                              style: TextStyle(fontSize: 12.sp),
                              controller: bookVehicleController.senderName,
                              validator: (val) {
                                if (val == "") {
                                  return "Enter Senders's Name";
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Sender's name",
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                      'assets/icons/contact_book_icon.png',
                                      height: 30,
                                    ),
                                  )),
                            ),
                            Obx(() => Row(
                                  children: [
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          isDense: true,
                                          value: bookVehicleController
                                              .selectedSenderCountry.value,
                                          items: BookVehicleController.countries
                                              .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Image.asset(
                                                    e.img,
                                                    width: 10.w,
                                                  )))
                                              .toList(),
                                          onChanged: bookVehicleController
                                              .selectSenderCountry),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        validator: (val) {
                                          if (val!.length !=
                                              bookVehicleController
                                                  .selectedSenderCountry
                                                  .value
                                                  .digitsInNumber) {
                                            return "Enter Mobile Number";
                                          }
                                        },
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(fontSize: 12.sp),
                                        controller:
                                            bookVehicleController.senderMobile,
                                        decoration: InputDecoration(
                                          hintText: "Mobile Number",
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'RECIEVER\'S INFORMATION',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Divider(
                              height: 1.h,
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Obx(() => CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                dense: true,
                                title: Text(
                                  'Same As Sender',
                                  style: TextStyle(
                                      fontSize: 11.sp, color: Colors.black),
                                ),
                                value: bookVehicleController.sameAsSender.value,
                                onChanged: bookVehicleController
                                    .sameAsSenderOnChanged)),
                            TextFormField(
                              validator: (val) {
                                if (val == "") {
                                  return "Enter Receiver Name";
                                }
                              },
                              style: TextStyle(fontSize: 12.sp),
                              controller: bookVehicleController.recieverName,
                              decoration: InputDecoration(
                                  hintText: "Reciever's name",
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                      'assets/icons/contact_book_icon.png',
                                      height: 30,
                                    ),
                                  )),
                            ),
                            Obx(() => Row(
                                  children: [
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          isDense: true,
                                          value: bookVehicleController
                                              .selectedRecieverCountry.value,
                                          items: BookVehicleController.countries
                                              .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Image.asset(
                                                    e.img,
                                                    width: 10.w,
                                                  )))
                                              .toList(),
                                          onChanged: bookVehicleController
                                              .selectRecieverCountry),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        validator: (val) {
                                          if (val!.length !=
                                              bookVehicleController
                                                  .selectedRecieverCountry
                                                  .value
                                                  .digitsInNumber) {
                                            return "Enter Mobile Number";
                                          }
                                        },
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(fontSize: 12.sp),
                                        controller: bookVehicleController
                                            .recieverMobile,
                                        decoration: InputDecoration(
                                          hintText: "Mobile Number",
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'LOAD DETAILS',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            Divider(
                              height: 1.h,
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Text(
                              'Goods Type*',
                              style: TextStyle(
                                  fontSize: 11.sp, color: Colors.grey),
                            ),
                            Obx(() => DropdownButtonFormField<GoodsModel>(
                                validator: (val) {
                                  if (val == null) {
                                    return "Select Goods Type";
                                  }
                                },
                                isExpanded: true,
                                value: bookVehicleController
                                    .selectedGoodType.value,
                                hint: Text('Select Goods Type'),
                                items: bookVehicleController.goodsList
                                    .map((e) => DropdownMenuItem<GoodsModel>(
                                          child: Text(e.name),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged:
                                    bookVehicleController.selectGoodType)),
                            Text(
                              'Weight*',
                              style: TextStyle(
                                  fontSize: 11.sp, color: Colors.grey),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val == "" ||
                                          double.parse(val!) >
                                              bookVehicleController
                                                  .selectedVehicle
                                                  .value
                                                  .loadWeight) {
                                        return "Enter Valid Weight";
                                      }
                                    },
                                    style: TextStyle(fontSize: 12.sp),
                                    controller:
                                        bookVehicleController.loadWeight,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: "Enter Weight",
                                    ),
                                  ),
                                ),
                                Obx(() => DropdownButtonHideUnderline(
                                      child: DropdownButton<weightUnit>(
                                          isDense: true,
                                          value: bookVehicleController
                                              .selectedWeightType.value,
                                          items: [
                                            DropdownMenuItem<weightUnit>(
                                                value: weightUnit.kg,
                                                child: Text('KG')),
                                            DropdownMenuItem<weightUnit>(
                                                value: weightUnit.lb,
                                                child: Text('Lb'))
                                          ],
                                          onChanged: bookVehicleController
                                              .selectWeightType),
                                    ))
                              ],
                            ),
                            Obx(
                              () => Text(
                                'Maximum Weight ' +
                                    (bookVehicleController
                                                .selectedWeightType.value ==
                                            weightUnit.kg
                                        ? bookVehicleController
                                            .selectedVehicle.value.loadWeight
                                            .toString()
                                        : WeightConverter.convertKgToLbs(
                                            kg: bookVehicleController
                                                .selectedVehicle
                                                .value
                                                .loadWeight
                                                .toString())) +
                                    " " +
                                    bookVehicleController
                                        .selectedWeightType.value.name +
                                    '*',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.blue.shade900),
                              ),
                            ),
                            PhysicalModel(
                              color: Colors.white,
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Do you need extra handler\'s'),
                                    Obx(() => DropdownButton(
                                        isExpanded: true,
                                        hint: Text('Select extra charge'),
                                        value: bookVehicleController
                                            .selectedExtraHandler.value,
                                        items: [
                                          DropdownMenuItem(
                                              value: true,
                                              child: Text(
                                                'YES',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              )),
                                          DropdownMenuItem(
                                              value: false,
                                              child: Text(
                                                'NO',
                                                style:
                                                    TextStyle(fontSize: 11.sp),
                                              ))
                                        ],
                                        onChanged: bookVehicleController
                                            .selectExtraHandler)),
                                  ],
                                ),
                              ),
                            ),
                            TextField(
                              maxLines: 3,
                              style: TextStyle(fontSize: 12.sp),
                              controller: bookVehicleController.aditionalNotes,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Aditional Notes",
                              ),
                            ),
                            PhysicalModel(
                              color: Colors.white,
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Price BreakDown'),
                                    Divider(
                                      height: 1.h,
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Column(
                                        children: [
                                          DottedLine(width: 80.w),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Total',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11.sp),
                                              ),
                                              Text(
                                                '${RupeeSymbol.rupeeSymbol} ${bookVehicleController.estimatePrice}',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11.sp),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            Positioned(
                bottom: 0,
                child: SizedBox(
                  width: 100.w,
                  child: RectangularGradientButton(
                    title: 'SUBMIT',
                    onTap: () {
                      if (bookVehicleController.addNewLoadFormKey.currentState!
                          .validate()) {
                        bookVehicleController.bookingMethod ==
                                bookingType.bookNow
                            ? bookVehicleController.callBookNowApi()
                            : bookVehicleController.callBookLaterApi();
                      }
                    },
                    gradient: AppColors.buttonGradientPurple,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
