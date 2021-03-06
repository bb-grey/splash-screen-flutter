import '../../../components/default_button.dart';
import 'package:ecommerce_splash/constants.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      'text': 'Welcome to Tokoto, Let\'s shop!',
      'image': 'assets/images/splash_1.png',
    },
    {
      'text':
          'We help people connect with store \naround United States of America',
      'image': 'assets/images/splash_2.png',
    },
    {
      'text': 'We show the easy way to shop. \nJust stay at home with us',
      'image': 'assets/images/splash_3.png',
    },
  ];
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (context, index) {
                  return SplashContent(
                    text: splashData[index]['text'],
                    image: splashData[index]['image'],
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => _buildDot(index: index),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    DefaultButton(
                      text: 'Continue',
                      press: () {},
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5.0),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
