import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/screens/signin_screen/signin_screen.dart';
import 'package:shop_app/screens/splash/cubit/cubit/splash_cubit.dart';
import 'package:shop_app/widgets/custom_button.dart';
import '../../constant.dart';
import '../../helper_method.dart';
import 'widgets/spalsh_point.dart';
import 'widgets/splash_page_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(
                  height: heightSize(context, 14),
                ),
                Text(
                  'TSHOP',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Muli-Bold'),
                ),
                SizedBox(
                  height: heightSize(context, 30),
                ),
                BlocBuilder<SplashCubit, SplashState>(
                  builder: (context, state) {
                    final SplashCubit cubit =
                        BlocProvider.of<SplashCubit>(context);
                    return Column(
                      children: [
                        SplashPageView(
                          pageController: cubit.pageController,
                          onPageChanged: (value) {
                            cubit.index = value;
                            cubit.getChange();
                          },
                        ),
                        SizedBox(
                          height: heightSize(context, 60),
                        ),
                        SplashPoints(cubit: cubit),
                        SizedBox(
                          height: heightSize(context, 10),
                        ),
                        CustomButton(
                          text: state is SplashChangeState
                              ? "Continue"
                              : state is SplashFinishState
                                  ? "Start"
                                  : state is SplashInitial
                                      ? "Continue"
                                      : '',
                          onTap: () {
                            cubit.pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.ease);
                            cubit.index == 2
                                ? navigatorPush(context, const SignInScreen())
                                : null;
                          },
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
