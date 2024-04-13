import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalapps/controllers/HomeController.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital App'),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.motionTabBarController,
        children: <Widget>[
          Center(
            child: Text("Dashboard"),
          ),
          Center(
            child: Text("Home"),
          ),
          Center(
            child: Text("Profile"),
          ),
          Center(
            child: Text("Settings"),
          ),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: controller.motionTabBarController,
        initialSelectedTab: "Home",
        labels: ["Home", "History", "MY APPOINTMENT", "PROFILE"],
        icons: [
          Icons.home,
          Icons.assignment_outlined,
          Icons.calendar_month_outlined,
          Icons.person_pin_rounded
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: const Color.fromARGB(255, 19, 29, 37),
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.blue[900],
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          controller.changeTabIndex(value);
        },
      ),
    );
  }
}
