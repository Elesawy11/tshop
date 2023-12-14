import 'package:flutter/material.dart';
import '../../../widgets/custom_image.dart';
class ListOfLogo extends StatelessWidget {
  const ListOfLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImage(
          image:'assets/icons/twitter.svg',
        ),
        CustomImage(
          image: 'assets/icons/google-icon.svg',
        ),
        CustomImage(
          image: 'assets/icons/facebook-2.svg',
        ),
      ],
    );
  }
}
