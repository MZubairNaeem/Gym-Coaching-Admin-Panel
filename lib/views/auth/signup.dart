// import 'package:flutter/material.dart';

// import '../../constants/colors.dart';
// import '../../controllers/auth_methods.dart';
// import '../../widgets/large_button_blue.dart';
// import '../../widgets/large_button_trasparent.dart';
// import '../../widgets/snackbar.dart';
// import 'login.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   final TextEditingController _name = TextEditingController();
//   bool _obscurePassword = true;
//   bool _isLoading = false;

//   Future<void> _signupUser() async {
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       var res = await Auth().signUpUser(
//         firstName: _name.text,
//         email: _email.text,
//         password: _password.text,
//         userType: "adminKey",
//       );
//       if (res == 'Success') {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const LoginScreen()));
//         showSnackBar(context, "Account created successfully.");
//       }
//     } catch (error) {
//       showSnackBar(context, error.toString());
//     }
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Center(
//           child: ConstrainedBox(
//             constraints: BoxConstraints(maxWidth: 500),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   'Signup',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 16.0),
//                 Material(
//                   elevation: 3.0,
//                   shadowColor: AppColors().lightShadowColor,
//                   borderRadius: BorderRadius.circular(50.0),
//                   child: TextField(
//                     controller: _name,
//                     decoration: InputDecoration(
//                         suffixIcon: Padding(
//                           padding: const EdgeInsets.only(right: 10.0),
//                           child: Icon(
//                             Icons.person,
//                             color: AppColors().darKShadowColor,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50.0),
//                           borderSide: BorderSide(
//                               width: 2,
//                               color: AppColors().primaryColor), //<-- SEE HERE
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50.0),
//                           borderSide: BorderSide(
//                               width: 1,
//                               color:
//                                   AppColors().lightShadowColor), //<-- SEE HERE
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50.0),
//                           borderSide: BorderSide(
//                               width: 1, color: AppColors().lightShadowColor),
//                         ),
//                         hintText: 'Name',
//                         hintStyle: const TextStyle(color: Colors.grey)),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 Material(
//                   elevation: 3.0,
//                   shadowColor: AppColors().lightShadowColor,
//                   borderRadius: BorderRadius.circular(50.0),
//                   child: TextField(
//                     controller: _email,
//                     decoration: InputDecoration(
//                         suffixIcon: Padding(
//                           padding: const EdgeInsets.only(right: 10.0),
//                           child: Icon(
//                             Icons.email,
//                             color: AppColors().darKShadowColor,
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50.0),
//                           borderSide: BorderSide(
//                               width: 2,
//                               color: AppColors().primaryColor), //<-- SEE HERE
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50.0),
//                           borderSide: BorderSide(
//                               width: 1,
//                               color:
//                                   AppColors().lightShadowColor), //<-- SEE HERE
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50.0),
//                           borderSide: BorderSide(
//                               width: 1, color: AppColors().lightShadowColor),
//                         ),
//                         hintText: 'Email',
//                         hintStyle: const TextStyle(color: Colors.grey)),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 Material(
//                   elevation: 3.0,
//                   shadowColor: AppColors().lightShadowColor,
//                   borderRadius: BorderRadius.circular(50.0),
//                   child: TextField(
//                     controller: _password,
//                     obscureText: _obscurePassword,
//                     decoration: InputDecoration(
//                         suffixIcon: Padding(
//                           padding: const EdgeInsets.only(right: 10.0),
//                           child: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 _obscurePassword = !_obscurePassword;
//                               });
//                             },
//                             icon: Icon(
//                               _obscurePassword
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: AppColors().darKShadowColor,
//                             ),
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50.0),
//                           borderSide: BorderSide(
//                               width: 2,
//                               color: AppColors().primaryColor), //<-- SEE HERE
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50.0),
//                           borderSide: BorderSide(
//                               width: 1,
//                               color:
//                                   AppColors().lightShadowColor), //<-- SEE HERE
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50.0),
//                           borderSide: BorderSide(
//                               width: 1, color: AppColors().lightShadowColor),
//                         ),
//                         hintText: 'Password',
//                         hintStyle: const TextStyle(color: Colors.grey)),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 LargeButton(name: "Sign up", onPressed: () {
//                   _signupUser();
//                 }),
//                 SizedBox(height: 16.0),
//                 _isLoading
//                     ? const Center(
//                         child: CircularProgressIndicator(),
//                       )
//                     : LargeButtonTransparent(
//                         name: "Login Page",
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => LoginScreen()));
//                         })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
