import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalapps/controllers/HomeController.dart';
import 'package:hospitalapps/screens/Doctors/HistoryScreenDoctor.dart';
import 'package:hospitalapps/screens/Doctors/MainScreenDoctor.dart';
import 'package:hospitalapps/screens/Doctors/MyAppointmentScreenDoctor.dart';
import 'package:hospitalapps/screens/Doctors/ProfileScreenDoctor.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';

class HomeScreenDoctor extends StatelessWidget {
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
          MainScreenDoctor(),
          HistoryDoctor(),
          MyAppointmentDoctor(),
          ProfileDoctor()
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
        tabSize: 60,
        tabBarHeight: 55,
        textStyle: TextStyle(
          fontSize: 9,
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
          switch (value) {
            case 0:
              controller.motionTabBarController.index = value;
              break;
            case 1:
              controller.motionTabBarController.index = value;
              break;
            case 2:
              controller.motionTabBarController.index = value;
              break;
            case 3:
              controller.motionTabBarController.index = value;
              break;
            default:
              controller.motionTabBarController.index = 0;
              break;
          }
        },
      ),
    );
  }
}
