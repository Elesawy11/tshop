import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant.dart';
import '../constant.dart';
import '../cubit/cubit/splash_cubit.dart';

class SplashPoints extends StatelessWidget {
  const SplashPoints({
    super.key,
    required this.cubit,
  });

  final SplashCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        kSplashImagesList.length,
        (index) => Container(
          margin: const EdgeInsets.only(right: 4),
          height: 7.h,
          width: cubit.index == index ? 20.w : 7.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: cubit.index == index ? kPrimaryColor : kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
