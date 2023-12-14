
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_button.dart';

class SigninScreenSuccess extends StatelessWidget {
  const SigninScreenSuccess({super.key});
  static String id = 'login screen success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Success',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        leading: SizedBox(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Image.asset(
            'assets/images/success.png',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Login Success',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 66.w),
                child: CustomButton(
                  text: 'Back To Home',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
