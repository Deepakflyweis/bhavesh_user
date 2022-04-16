import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchedLocationTile extends StatelessWidget {
  const SearchedLocationTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
        child: InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: TextStyle(fontSize: 12.sp),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
