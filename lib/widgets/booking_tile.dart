import 'package:we_fast/constants/constants.dart';
import 'package:we_fast/essentails.dart';
import 'package:we_fast/models/booking_model.dart';
import 'package:we_fast/widgets/start_stop_widget.dart';

class BookingTile extends StatelessWidget {
  const BookingTile({
    Key? key,
    required this.bookingModel,
  }) : super(key: key);
  final BookingModel bookingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/booking_image.png',
                width: 20.w,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Today, 05:00 PM \n Truck name'),
              Spacer(),
              Text('${RupeeSymbol.rupeeSymbol} XXXXXX'),
              Center(child: const Icon(Icons.chevron_right))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StartStopWidget(
                distance: 10,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 80.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4)),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '    Present Address',
                          style: TextStyle(color: Colors.grey),
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 30,
                    width: 80.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4)),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "    Reciever's Address",
                          style: TextStyle(color: Colors.grey),
                        )),
                  ),
                ],
              )
            ],
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Delivery Cancelled!',
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }
}
