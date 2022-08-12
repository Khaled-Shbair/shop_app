import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/string.dart';
import '../../widgets/on boarding widget.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int page = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        Visibility(
          visible: page == 2,
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, loginScreen);
            },
            child: const Text(
              'Next',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  page = value;
                });
              },
              controller: pageController,
              children: const [
                OnBoardingWidget(
                  svgPicture:
                      'assets/images/on boarding image/on_boarding_2.svg',
                  titleText: 'Welcome!',
                  subTitleText:
                      'Now were up in the big leagues \ngetting our turn at bat. The Brady Bunch \nthat\'s the way we  Brady Bunch..',
                ),
                OnBoardingWidget(
                  svgPicture:
                      'assets/images/on boarding image/on_boarding_1.svg',
                  titleText: 'Add to cart',
                  subTitleText:
                      'Now were up in the big leagues \ngetting our turn at bat. The Brady Bunch \nthat\'s the way we  Brady Bunch..',
                ),
                OnBoardingWidget(
                  svgPicture:
                      'assets/images/on boarding image/on_boarding_3.svg',
                  titleText: 'Enjoy Purchase!',
                  subTitleText:
                      'Now were up in the big leagues \ngetting our turn at bat. The Brady Bunch \nthat\'s the way we  Brady Bunch..',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                  expansionFactor: 4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
/*
 TabPageSelectorIndicator(
                backgroundColor: page == 0 ? Colors.black : Colors.blue,
                borderColor: Colors.blueAccent,
                size: 20,
              ),
*/
