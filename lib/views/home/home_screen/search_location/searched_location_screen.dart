import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/views/home/home_screen/search_location/add_stops_bottom_modal.dart';
import 'package:we_fast/widgets/buttons/rounded_gradient_button.dart';

class SearchedLocationScreen extends StatelessWidget {
  const SearchedLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              height: 4.h,
              top: 15,
              left: 15,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.chevron_left,
                  size: 25.sp,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Positioned(
                bottom: 20,
                left: 5.w,
                child: SizedBox(
                  width: 90.w,
                  child: RoundedGradientButton(
                    title: 'Confirm Location',
                    onTap: () {
                      // Get.to(() => AddStopsBottomModal());
                      showModalBottomSheet(
                          /* constraints:
                              BoxConstraints(minHeight: 150, maxHeight: 150), */
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) =>
                              AddStopsBottomModal());
                    },
                    gradient: AppColors.buttonGradientPurple,
                  ),
                )),
            Positioned(
              top: 15.h,
              left: 12.5.w,
              child: TextFormField(
                // validator: loginController.numberValidator,
                cursorColor: Colors.black,
                // controller: loginController.mobileNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    constraints: BoxConstraints(
                      maxHeight: 4.h,
                      maxWidth: 75.w,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 20),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'Search Location',
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
