import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/views/home/home_screen/search_location/searched_location_screen.dart';

class SearchDropLocation extends StatelessWidget {
  const SearchDropLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Drop Location',
          style: TextStyle(color: Colors.black, fontSize: 13.sp),
        ),
        bottom: PreferredSize(
          preferredSize: Size(100.w, 5.h),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                Get.to(() => SearchedLocationScreen());
              },
              decoration: InputDecoration(
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
        ),
      ),
    );
  }
}
