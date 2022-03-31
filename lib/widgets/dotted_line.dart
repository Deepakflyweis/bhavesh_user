import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < width / 4; i++)
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              color: Colors.grey,
              height: 2,
              width: 2,
            ),
          )
      ],
    );
  }
}
