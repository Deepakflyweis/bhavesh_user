import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_fast/views/home/home_screen/book_later_screen/pick_up_details_for_book_later.dart';
import 'package:we_fast/views/home/home_screen/book_now_screen/pick_up_details_for_book_now.dart';
import 'package:we_fast/views/home/home_screen/search_location/search_drop_location.dart';
import 'package:we_fast/views/home/home_screen/search_location/search_pickup_location.dart';
import 'package:we_fast/widgets/appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:we_fast/widgets/vehicle_details_dialog_content.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  final BookVehicleController bookVehicleController =
      Get.put(BookVehicleController(), permanent: true);
  final List<String> banners = const [
    'assets/images/banner_1.png',
    'assets/images/banner_2.png',
    'assets/images/banner_3.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: SvgPicture.asset(
          'assets/icons/logo.svg',
          height: 30,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            width: 100.w,
            child: CarouselSlider.builder(
              itemCount: banners.length,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16.5 / 4),
              itemBuilder: (context, index, i) {
                return Image.asset(banners[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onTap: () {
                Get.to(() => SearchPickUpLocation());
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 15),
                  hintText: 'Pick Up Location',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 17.sp,
                  ),
                  suffixIcon: Icon(
                    Icons.cancel_outlined,
                    color: Colors.grey,
                    size: 17.sp,
                  ),
                  constraints: BoxConstraints(maxHeight: 4.h),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(50),
                  )),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onTap: () {
                Get.to(() => SearchDropLocation());
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 15),
                  hintStyle: TextStyle(fontSize: 13.sp),
                  hintText: 'Drop Location',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 17.sp,
                  ),
                  suffixIcon: Icon(
                    Icons.cancel_outlined,
                    color: Colors.grey,
                    size: 17.sp,
                  ),
                  constraints: BoxConstraints(maxHeight: 4.h),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(50),
                  )),
            ),
          ),
          Container(
            height: 10.h,
            color: AppColors.backgroundColor,
            child: Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(8), //index 0 is truck
                            color:
                                bookVehicleController.selectedVehicle.value ==
                                        bookVehicleController.allVehicles[0]
                                    ? AppColors.primaryColor.withOpacity(0.25)
                                    : Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                  title: '',
                                  content: VehicleDetailsDialogContent(
                                    img: 'assets/images/truck_dimension.png',
                                    onTap: () {
                                      bookVehicleController.selectedVehicle(
                                          bookVehicleController.allVehicles[0]);
                                      Get.back();
                                    },
                                  ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Truck',
                                  style: TextStyle(fontSize: 13.sp),
                                ),
                                Image.asset(
                                  'assets/images/truck.png',
                                  height: 4.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(8), //index 1 is carter
                            color:
                                bookVehicleController.selectedVehicle.value ==
                                        bookVehicleController.allVehicles[1]
                                    ? AppColors.primaryColor.withOpacity(0.25)
                                    : Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                  title: '',
                                  content: VehicleDetailsDialogContent(
                                    img: 'assets/images/carter_dimension.png',
                                    onTap: () {
                                      bookVehicleController.selectedVehicle(
                                          bookVehicleController.allVehicles[1]);
                                      Get.back();
                                    },
                                  ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Carter',
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                Image.asset(
                                  'assets/images/box-truck.png',
                                  height: 4.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(8), //index 2 is 3 wheeler
                            color:
                                bookVehicleController.selectedVehicle.value ==
                                        bookVehicleController.allVehicles[2]
                                    ? AppColors.primaryColor.withOpacity(0.25)
                                    : Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                  title: '',
                                  content: VehicleDetailsDialogContent(
                                    img:
                                        'assets/images/3_wheeler_dimension.png',
                                    onTap: () {
                                      bookVehicleController.selectedVehicle(
                                          bookVehicleController.allVehicles[2]);
                                      Get.back();
                                    },
                                  ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '3-wheeler',
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                Image.asset(
                                  'assets/images/tuk-tuk.png',
                                  height: 4.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(8), //index 3 is 2 wheeler
                            color:
                                bookVehicleController.selectedVehicle.value ==
                                        bookVehicleController.allVehicles[3]
                                    ? AppColors.primaryColor.withOpacity(0.25)
                                    : Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                  title: '',
                                  content: VehicleDetailsDialogContent(
                                    img:
                                        'assets/images/2_wheller_dimension.png',
                                    onTap: () {
                                      bookVehicleController.selectedVehicle(
                                          bookVehicleController.allVehicles[3]);
                                      Get.back();
                                    },
                                  ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2-wheeler',
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                Image.asset(
                                  'assets/images/scooter.png',
                                  height: 4.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(8), //index 4 is eeco
                            color:
                                bookVehicleController.selectedVehicle.value ==
                                        bookVehicleController.allVehicles[4]
                                    ? AppColors.primaryColor.withOpacity(0.25)
                                    : Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: InkWell(
                            onTap: () {
                              //todo set eeco image
                              Get.defaultDialog(
                                  title: '',
                                  content: VehicleDetailsDialogContent(
                                    img: 'assets/images/eeco_dimensions.png',
                                    onTap: () {
                                      bookVehicleController.selectedVehicle(
                                          bookVehicleController.allVehicles[4]);
                                      Get.back();
                                    },
                                  ));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Eeco',
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                Image.asset(
                                  'assets/images/van.png',
                                  height: 4.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => PickUpDetailsForBookNow());
                },
                child: Container(
                  height: 5.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    gradient: AppColors.buttonGradientPurple,
                  ),
                  child: Center(
                      child: Text(
                    'Book Now',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => PickUpDetailsForBookLater());
                },
                child: Container(
                  height: 5.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor)),
                  child: Center(
                      child: Text(
                    'Book Later',
                    style: TextStyle(color: AppColors.primaryColor),
                  )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
