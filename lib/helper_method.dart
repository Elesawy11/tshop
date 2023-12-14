
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double heightSize(BuildContext context, height) {
    double heightSize = MediaQuery.of(context).size.height / height;
    return heightSize;
  }


double widthSize(BuildContext context, height) {
    double widthSize = MediaQuery.of(context).size.height / height;
    return widthSize;
  }

void navigatorReplacement(BuildContext context, route) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => route),);
  }


void navigatorPush(BuildContext context, route) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => route),);
  }

String? validatorMethod(value) {
    if (value!.isEmpty) {
      return 'required faield';
    }
    return null;
  }

OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(
        color: Colors.black54,
      ),
      gapPadding: 10,
    );
  }