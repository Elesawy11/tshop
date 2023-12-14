import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/helper_method.dart';
import 'package:shop_app/screens/signin_success/signin_screen_success.dart';
import 'package:shop_app/widgets/show_snack_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

import '../signup_screen/signup_screen.dart';
import 'cubit/cubit/sign_in_cubit.dart';
import 'widgets/beggining_of_screen.dart';
import 'widgets/list_of_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  bool inAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInFailure) {
            inAsyncCall = false;

            showSnackBar(context, state.errMessage);
          } else if (state is SignInSuccess) {
            inAsyncCall = false;

            navigatorPush(context, const SigninScreenSuccess());
          } else if (state is SignInLoading) {
            inAsyncCall = true;
          }
        },
        builder: (context, state) {
          SignInCubit cubit = BlocProvider.of<SignInCubit>(context);

          return ModalProgressHUD(
            inAsyncCall: inAsyncCall,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Sign in ',
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
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const BeginningOfScreen(
                            text1: 'Welcome Back',
                            text2: 'sign in with your email and password ',
                            text3: 'or continue with social media',
                          ),
                          SizedBox(
                            height: heightSize(context, 10),
                          ),
                          CustomTextFormField(
                            validator: validatorMethod,
                            onChanged: (value) {
                              email = value;
                            },
                            label: 'Email',
                            hintText: 'Enter your email',
                            suffixIcon: Icons.email_outlined,
                          ),
                          SizedBox(
                            height: heightSize(context, 24),
                          ),
                          CustomTextFormField(
                            validator: validatorMethod,
                            onChanged: (value) {
                              password = value;
                            },
                            obscureText: true,
                            label: 'Password',
                            hintText: 'Enter your password',
                            suffixIcon: Icons.lock_outlined,
                          ),
                          SizedBox(
                            height: heightSize(context, 24),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      cubit.isSelected();
                                    },
                                    child: Icon(
                                      state is SignInChange
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                    ),
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontSize: 14.sp),
                                  ),
                                ],
                              ),
                              Text(
                                'Forgot password',
                                style: TextStyle(
                                    color: kSecondaryColor,
                                    fontSize: 14.sp,
                                    decoration: TextDecoration.underline),
                              )
                            ],
                          ),
                          SizedBox(
                            height: heightSize(context, 14),
                          ),
                          CustomButton(
                            text: 'Continue',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.loginUser(
                                    email: email!, password: password!);
                                // Navigator.pushNamed(context, LoginScreenSuccess.id);
                              }
                            },
                          ),
                          SizedBox(
                            height: heightSize(context, 18),
                          ),
                          const ListOfLogo(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an acount? ',
                                style: TextStyle(
                                  color: kSecondaryColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigatorPush(context, const SignUpScreen());
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 14.sp),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
