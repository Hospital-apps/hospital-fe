import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalapps/controllers/ProfileController.dart';

class Profile extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          // Using Obx here to listen to changes
          if (profileController.userProfile.isEmpty) {
            return CircularProgressIndicator(); // Show loading indicator while data is being fetched
          }
          return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'assets/img/profile.jpeg'), // Consider changing to network image if needed
                ),
                SizedBox(height: 20),
                Text(
                  profileController.userProfile['fullName'] ?? 'N/A',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                UserInfoRow(
                  label: "Nickname:",
                  value: profileController.userProfile['nickname'] ?? 'N/A',
                ),
                UserInfoRow(
                  label: "Email:",
                  value: profileController.userProfile['email'] ?? 'N/A',
                ),
                UserInfoRow(
                  label: "Phone Number:",
                  value: profileController.userProfile['phoneNumber'] ?? 'N/A',
                ),
                UserInfoRow(
                  label: "Role:",
                  value: profileController.userProfile['role'] ?? 'N/A',
                ),
                SizedBox(height: 40),
                LogoutButton(),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class UserInfoRow extends StatelessWidget {
  final String label;
  final String value;

  UserInfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Logout button pressed');
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        'Logout',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
