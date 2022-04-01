import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    required this.err,
  }) : super(key: key);
  final String err;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(err),
    );
  }
}
