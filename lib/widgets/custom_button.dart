import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.pageController,
    this.isSelected = 0,
    this.onTap,
    required this.text,
  });
  final PageController? pageController;
  final int isSelected;
  final VoidCallback? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
