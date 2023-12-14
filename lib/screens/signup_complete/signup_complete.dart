import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/helper_method.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../signin_screen/widgets/beggining_of_screen.dart';
import '../signin_screen/widgets/list_of_logo.dart';

class SignUpComplete extends StatefulWidget {
  const SignUpComplete({super.key});

  @override
  State<SignUpComplete> createState() => _SignUpCompleteState();
}

class _SignUpCompleteState extends State<SignUpComplete> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? firstName, lastName, phone, address;

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BeginningOfScreen(
                    text1: 'Register Account',
                    text2: 'complete your details or continue ',
                    text3: 'with social media',
                  ),
                  SizedBox(
                    height: heightSize(context, 20),
                  ),
                  Column(
                    children: [
                      CustomTextFormField(
                        validator: validatorMethod,
                        onChanged: (value) {
                          firstName = value;
                        },
                        label: 'First name',
                        hintText: 'Enter your first name',
                        suffixIcon: Icons.person,
                      ),
                      SizedBox(
                        height: heightSize(context, 30),
                      ),
                      CustomTextFormField(
                        validator: validatorMethod,
                        onChanged: (value) {
                          lastName = value;
                        },
                        label: 'Last name',
                        hintText: 'Enter your last name',
                        suffixIcon: Icons.person,
                      ),
                      SizedBox(
                        height: heightSize(context, 30),
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        validator: validatorMethod,
                        onChanged: (value) {
                          phone = value;
                        },
                        label: 'Phone number',
                        hintText: 'Enter your Phone number',
                        suffixIcon: Icons.phone_iphone,
                      ),
                      SizedBox(
                        height: heightSize(context, 30),
                      ),
                      CustomTextFormField(
                        validator: validatorMethod,
                        onChanged: (value) {
                          address = value;
                        },
                        label: 'Address',
                        hintText: 'Enter your Address',
                        suffixIcon: Icons.location_on,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightSize(context, 18),
                  ),
                  CustomButton(
                    text: 'Continue',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        navigatorPush(context, OtpScreen());
                      }
                    },
                  ),
                  SizedBox(
                    height: heightSize(context, 20),
                  ),
                  const ListOfLogo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'By continuing your confirm you agree with our Term and Condition ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
