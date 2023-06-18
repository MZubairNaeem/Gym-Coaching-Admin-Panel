import 'package:fitnessadminpanel/views/auth/forget_password.dart';
import 'package:fitnessadminpanel/views/auth/signup.dart';
import 'package:fitnessadminpanel/views/dashboard_screen.dart';
import 'package:fitnessadminpanel/widgets/large_button_blue.dart';
import 'package:fitnessadminpanel/widgets/large_button_trasparent.dart';
import 'package:fitnessadminpanel/widgets/snackbar.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Material(
                  elevation: 3.0,
                  shadowColor: AppColors().lightShadowColor,
                  borderRadius: BorderRadius.circular(50.0),
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.email,
                            color: AppColors().darKShadowColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(
                              width: 2,
                              color: AppColors().primaryColor), //<-- SEE HERE
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(
                              width: 1,
                              color:
                                  AppColors().lightShadowColor), //<-- SEE HERE
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(
                              width: 1, color: AppColors().lightShadowColor),
                        ),
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 16.0),
                Material(
                  elevation: 3.0,
                  shadowColor: AppColors().lightShadowColor,
                  borderRadius: BorderRadius.circular(50.0),
                  child: TextField(
                    controller: _password,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors().darKShadowColor,
                            ),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(
                              width: 2,
                              color: AppColors().primaryColor), //<-- SEE HERE
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(
                              width: 1,
                              color:
                                  AppColors().lightShadowColor), //<-- SEE HERE
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(
                              width: 1, color: AppColors().lightShadowColor),
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 16.0),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => ForgotPasswordScreen()));
                //   },
                //   child: Align(
                //     alignment: Alignment.centerRight,
                //     child: Padding(
                //       padding: EdgeInsets.only(right: size.width * 0.02),
                //       child: Text(
                //         "Forgot Password",
                //         style: TextStyle(
                //           color: AppColors().primaryColor,
                //           fontSize: 22,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 16.0),
                LargeButton(
                    name: "Login",
                    onPressed: () {
                      if (_email.text == 'admin@gmail.com' &&
                          _password.text == 'admin123') {
                            setState(() {
                              _isLoading = true;
                            });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()));
                      } else {
                        showSnackBar(context, "Wrond Admin Credentials");
                      }
                    }),
                SizedBox(height: 16.0),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : LargeButtonTransparent(name: "", onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
