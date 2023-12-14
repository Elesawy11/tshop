import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constant.dart';
import 'package:shop_app/helper_method.dart';
import 'package:shop_app/screens/signup_complete/signup_complete.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../signin_screen/widgets/beggining_of_screen.dart';
import '../signin_screen/widgets/list_of_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;

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
      body: SingleChildScrollView(
        child: SizedBox(
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
                            email = value;
                          },
                          label: 'Name',
                          hintText: 'Enter your Name',
                          suffixIcon: Icons.person,
                        ),
                        SizedBox(
                          height: heightSize(context, 30),
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
                          height: heightSize(context, 30),
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
                          height: heightSize(context, 30),
                        ),
                        CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'required faield';
                            }
                            if (value != password) {
                              return 'wrong password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            // password = value;
                          },
                          obscureText: true,
                          label: 'Confirm Password',
                          hintText: 'Re-enter your password',
                          suffixIcon: Icons.lock_outlined,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightSize(context, 16),
                    ),
                    CustomButton(
                      text: 'Continue',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          navigatorPush(context, SignUpComplete());
                          // cubit.registerUser(
                          //     email: email!, password: password!);
                          // Navigator.pushNamed(context, LoginScreenSuccess.id);
                        }
                      },
                    ),
                    SizedBox(
                      height: heightSize(context, 60),
                    ),
                    const ListOfLogo(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Flexible(
                            child: Text(
                              'By continuing your confirm you agree with our Term and Condition ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // overflow: TextOverflow.ellipsis,
                                color: kSecondaryColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: heightSize(context, 60),
                    ),
                  ],
                ),
              ),
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
