import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContactBuilder extends StatelessWidget {
  const ContactBuilder(
      {Key? key,
      required this.title,
      required this.img,
      required this.subTitle})
      : super(key: key);
  final String img, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            img,
            height: 35,
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 13.sp),
              ),
              Text(
                subTitle,
                style: TextStyle(fontSize: 10.sp),
              )
            ],
          )
        ],
      ),
    );
  }
}
