import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TransactionsTile extends StatelessWidget {
  const TransactionsTile(
      {Key? key,
      required this.companyName,
      required this.transactionDateTime,
      required this.amount})
      : super(key: key);
  final String companyName;
  final DateTime transactionDateTime;
  final double amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
            'assets/images/truck_circle.png',
            height: 7.h,
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 40.w,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: companyName),
                  TextSpan(
                    text:
                        '\n${transactionDateTime.day}/${transactionDateTime.month}/${transactionDateTime.year}  ${transactionDateTime.hour}:${transactionDateTime.minute}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Text(
            '-$amount',
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
