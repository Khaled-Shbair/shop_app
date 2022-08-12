import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    Key? key,
    required this.svgPicture,
    required this.titleText,
    required this.subTitleText,
  }) : super(key: key);
  final String svgPicture;
  final String titleText;
  final String subTitleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPicture,
            width: double.infinity,
            height: 300,
          ),
          const SizedBox(height: 20),
          Text(
            titleText,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Color(0xFF23203F),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Now were up in the big leagues \ngetting our turn at bat. The Brady Bunch \nthat\'s the way we  Brady Bunch..',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.5,
              fontSize: 17,
              fontWeight: FontWeight.w300,
              color: Color(0xFF716F87),
            ),
          ),
        ],
      ),
    );
  }
}
