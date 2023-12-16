import 'package:flutter/material.dart';

import '../core/color_manager.dart';

Widget myBotton({
  double width = double.infinity,
  Color? background = AppColors.mainColor,
  required var function,
  double radius = 10,
  bool isUppercase = true,
  required String text,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        height: 35,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: const TextStyle(color: AppColors.white,fontSize: 16),
        ),
      ),
    );
