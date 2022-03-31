import 'package:we_fast/essentails.dart';

class SenderReceiverTile extends StatelessWidget {
  const SenderReceiverTile({Key? key,required this.sName,required this.sMobile,required this.rName,required this.rMobile}) : super(key: key);
  final String sName,sMobile,rName,rMobile;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      width: 100.w,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.grey.shade200,
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sender',style: TextStyle(color: Colors.black,fontSize: 12.sp),),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(sName,style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                      Text(sMobile,style: TextStyle(color: Colors.blue.shade600,fontSize: 12.sp),)
                    ],
                  ),
                  Container(
                    width: 1,
                    color: Colors.grey.shade200,
                    height: 14.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Receiver',style: TextStyle(color: Colors.black,fontSize: 12.sp),),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(rName,style: TextStyle(color: Colors.grey,fontSize: 12.sp),),
                      Text(rMobile,style: TextStyle(color: Colors.blue.shade600,fontSize: 12.sp),)
                    ],
                  ),
                ],
              ),
              Container(
                color: Colors.grey.shade200,
                height: 1,
              ),
            ],
          ),
          Center(child: Image.asset('assets/icons/green_right_arrow.png',width: 10.w,fit: BoxFit.fitWidth,))
        ],
      ),
    );
  }
}
