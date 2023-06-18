import 'package:fitnessadminpanel/views/auth/login.dart';
import 'package:fitnessadminpanel/widgets/large_button_blue.dart';
import 'package:fitnessadminpanel/widgets/large_button_trasparent.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _email = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
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
                  'Forgot Password',
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
                SizedBox(height: 16.0),
                LargeButton(name: "Send Reset Mail", onPressed: () {}),
                SizedBox(height: 16.0),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : LargeButtonTransparent(
                        name: "Login",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
