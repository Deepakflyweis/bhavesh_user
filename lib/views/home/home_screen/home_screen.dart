import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/banners_controller.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_fast/views/home/home_screen/book_later_screen/pick_up_details_for_book_later.dart';
import 'package:we_fast/views/home/home_screen/book_now_screen/pick_up_details_for_book_now.dart';
import 'package:we_fast/views/home/home_screen/search_location/search_drop_location.dart';
import 'package:we_fast/views/home/home_screen/search_location/search_pickup_location.dart';
import 'package:we_fast/widgets/appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:we_fast/widgets/error_widget.dart';
import 'package:we_fast/widgets/vehicle_details_dialog_content.dart';

class HomeScreen extends GetView<BookVehicleController> {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  final BookVehicleController bookVehicleController =
      Get.put(BookVehicleController(), permanent: true);
  BannersController _bannersController = Get.put(BannersController());
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
          _bannersController.obx(
            (state) => SizedBox(
              height: 100,
              width: 100.w,
              child: CarouselSlider.builder(
                itemCount: state!.length,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16.5 / 4),
                itemBuilder: (context, index, i) {
                  return Image.network(
                    state[index].image,
                    errorBuilder: (context, Object, StackTrace) => Center(
                      child: Icon(
                        Icons.image,
                      ),
                    ),
                  );
                },
              ),
            ),
            onError: (error) => CustomErrorWidget(err: error),
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
            child: controller.obx(
              (state) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state!.length,
                  itemBuilder: ((context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Obx(
                          () => Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(8), //index 0 is truck
                                color: controller.selectedVehicle.value ==
                                        state[index]
                                    ? AppColors.primaryColor.withOpacity(0.25)
                                    : Colors.transparent),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                      title: state[index].name,
                                      content: VehicleDetailsDialogContent(
                                        vehicleDetailsModel: state[index],
                                        onTap: () {
                                          controller
                                              .selectedVehicle(state[index]);
                                          controller.selectedVehicle.refresh();
                                          Get.back();
                                        },
                                      ));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state[index].name,
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                    Image.network(
                                      state[index].image,
                                      height: 4.h,
                                      errorBuilder:
                                          (context, Object, StackTrace) =>
                                              Center(
                                                  child: Icon(
                                        Icons.image,
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
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
