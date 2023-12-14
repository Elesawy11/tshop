import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/helper_method.dart';

class BeginningOfScreen extends StatelessWidget {
  const BeginningOfScreen({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  final String text1, text2, text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: heightSize(context, 40),
        ),
        Text(
          text1,
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Muli-Bold',
          ),
        ),
        SizedBox(
          height: heightSize(context, 40),
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 16.sp,
            color: kSecondaryColor,
          ),
        ),
        Text(
          text3,
          style: TextStyle(
            fontSize: 16.sp,
            color: kSecondaryColor,
          ),
        ),
      ],
    );
  }
}
