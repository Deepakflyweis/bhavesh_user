import 'package:flutter/material.dart';
import 'package:we_fast/widgets/vertical_dotted_line.dart';

class AddedStopsWidget extends StatelessWidget {
  const AddedStopsWidget({Key? key, required this.stops}) : super(key: key);
  final int stops;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 6,
              width: 6,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ),
        for (int i = 0; i < stops; i++)
          Column(
            children: [
              VerticalDottedLine(height: 40),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  ),
                ),
              ),
            ],
          ),
        VerticalDottedLine(height: 40),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 6,
              width: 6,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ),
        Column(
          children: [
            VerticalDottedLine(height: 40),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.blue,
                size: 15,
              ),
            )
          ],
        )
      ],
    );
  }
}
