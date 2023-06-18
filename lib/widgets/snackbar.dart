import 'package:flutter/material.dart';
import '../constants/colors.dart';

showSnackBar(BuildContext context,String content, ) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors().primaryColor,

      content: Text(content,style: TextStyle(color: AppColors().whiteColor,fontWeight: FontWeight.bold),),
      duration: const Duration(seconds: 2),
    ),
  );
}