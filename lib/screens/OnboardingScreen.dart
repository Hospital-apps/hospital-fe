import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:hospitalapps/screens/LoginScreen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightfix = MediaQuery.of(context).size.height * 0.32;

    return CupertinoApp(
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Login',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.black,
        ),
        skipTextButton: Text('Skip'),
        onFinish: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        hasSkip: true,
        background: [
          Center(
            child: Image.asset(
              'assets/img/slide_01.png',
              fit: BoxFit.cover,
              scale: 1.0,
              height: heightfix,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/img/slide_01.png',
              fit: BoxFit.cover,
              scale: 1.0,
              height: heightfix,
            ),
          ),
        ],
        totalPage: 2,
        speed: 1.8,
        centerBackground: true,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 320,
                ),
                Text(
                  'Xiaozhuang Hospital',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Welcome to Xiaozhuang Hospital.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 320,
                ),
                Text(
                  'Xiaozhuang Hospital',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Xiaozhuang Hospital provides health facilities to make it easier for people who need medical assistance.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
