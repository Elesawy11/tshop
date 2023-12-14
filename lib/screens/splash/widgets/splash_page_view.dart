import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constant.dart';

import '../../../helper_method.dart';
import '../constant.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({
    super.key,
    required this.pageController,
    this.onPageChanged,
  });
  final PageController pageController;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(context, 2),
      // width: widthSize(context, 1),
      child: PageView(
        physics: const BouncingScrollPhysics(),
        onPageChanged: onPageChanged,
        controller: pageController,
        children: List.generate(
          kSplashImagesList.length,
          (index) => SizedBox(
            child: Column(
              children: [
                Text(
                  kSplashImagesList[index][0],
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontFamily: 'Muli-Semi-BoldItalic',
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: heightSize(context, 60),
                ),
                SizedBox(
                  width: widthSize(context, 4),
                  height: heightSize(context, 3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      kSplashImagesList[index][1],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
