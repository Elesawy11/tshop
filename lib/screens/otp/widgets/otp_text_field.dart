import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper_method.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    super.key,
    this.onChanged,
    this.onSaved,
  });
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      width: 68.w,
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge,
        onChanged: onChanged,
        onSaved: onSaved,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
            hintText: '0',
            enabledBorder: borderDecoration(),
            focusedBorder: borderDecoration(),
            border: borderDecoration()),
      ),
    );
  }
}
