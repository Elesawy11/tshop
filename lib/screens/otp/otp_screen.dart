import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/helper_method.dart';
import 'package:shop_app/screens/show_screen/show_screen.dart';
import '../../widgets/custom_button.dart';
import '../signin_screen/widgets/beggining_of_screen.dart';
import 'widgets/otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, phone, address;

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => SignUpCubit(),
    //   child: BlocConsumer<SignUpCubit, SignUpState>(
    // listener: (context, state) {
    //   if (state is SignUpFailure) {
    //     showSnackBar(context, state.errMessage);
    //     inAsyncCall = false;
    //   } else if (state is SignUpSuccess) {
    //     navigatorPush(context, const SigninScreenSuccess());
    //     inAsyncCall = false;
    //   } else if (state is SignUpLoading) {
    //     inAsyncCall = true;
    //   }
    // },
    // builder: (context, state) {
    //   SignUpCubit cubit = BlocProvider.of<SignUpCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign up ',
          style: TextStyle(color: kSecondaryColor, fontSize: 24.sp),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: kSecondaryColor,
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BeginningOfScreen(
                  text1: 'Register Account',
                  text2: 'we sent code to 1987 *** ',
                  text3: 'this code will expired in ',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OtpTextField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextField(
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ],
                ),
                CustomButton(
                  text: 'Continue',
                  onTap: () {
                      navigatorPush(context, ShowScreen());

                    if (formKey.currentState!.validate()) {
                      // cubit.registerUser(
                      //     email: email!, password: password!);
                      // Navigator.pushNamed(context, LoginScreenSuccess.id);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Resent otp code ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    //       },
    //     ),
    //   );
  }
}
