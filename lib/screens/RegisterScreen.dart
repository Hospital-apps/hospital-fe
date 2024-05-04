import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospitalapps/controllers/RegisterController.dart';
import 'package:hospitalapps/widgets/TextField.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController controller = Get.put(RegisterController());

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  String selectedRole = 'Patient';

  final List<String> typeItems = [
    'Pasien',
    'Dokter',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Come on, Register Now!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    CustomTextFormField(
                        label: 'Full Name', controller: fullNameController),
                    SizedBox(height: 16.0),
                    CustomTextFormField(
                        label: 'Nickname', controller: nicknameController),
                    SizedBox(height: 16.0),
                    CustomTextFormField(
                        label: 'Email', controller: emailController),
                    SizedBox(height: 16.0),
                    CustomTextFormField(
                        label: 'Phone Number',
                        controller: phoneNumberController),
                    SizedBox(height: 16.0),
                    CustomTextFormField(
                        label: 'Password',
                        isPassword: true,
                        controller: passwordController),
                    SizedBox(height: 16.0),
                    Obx(() => InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Role', // Label for the dropdown
                            border:
                                OutlineInputBorder(), // Consistent border style
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: controller.selectedRole.value,
                              onChanged: (String? newValue) {
                                controller.selectedRole.value = newValue!;
                              },
                              items: typeItems.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.register(
                      fullName: fullNameController.text,
                      nickname: nicknameController.text,
                      email: emailController.text,
                      phoneNumber: phoneNumberController.text,
                      password: passwordController.text,
                      role: selectedRole,
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
