import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/controllers/book_vehicle_controller.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/widgets/buttons/rounded_gradient_button.dart';
import 'package:we_fast/widgets/drawer_appbar.dart';

class SelectGoodsType extends StatelessWidget {
  SelectGoodsType({Key? key}) : super(key: key);
  final BookVehicleController bookVehicleController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DrawerAppBar(title: 'Select your goods type'),
      body: Stack(
        children: [
          ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: bookVehicleController.goodsList.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: InkWell(
                onTap: () {
                  bookVehicleController
                      .selectGoodType(bookVehicleController.goodsList[index]);
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(bookVehicleController.goodsList[index].name,
                      style: TextStyle(
                        fontSize: 13.sp,
                      )),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.w,
                child: RoundedGradientButton(
                    title: 'Update',
                    gradient: AppColors.buttonGradientPurple,
                    onTap: () {
                      if (bookVehicleController.selectedGoodType != "") {
                        Get.back();
                      }
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
