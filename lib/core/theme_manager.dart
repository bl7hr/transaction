import 'package:eygept/core/color_manager.dart';
import 'package:eygept/core/fonts_manager.dart';
import 'package:eygept/core/sizes_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: AppColors.mainColor,
      fontFamily: 'FontApp',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppFont.title,
            color: AppColors.black),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: AppFont.subTitle,
            color: AppColors.grey),
        bodyMedium:
            TextStyle(fontWeight: FontWeight.normal, fontSize: AppFont.normal),
        bodySmall:
            TextStyle(fontWeight: FontWeight.normal, fontSize: AppFont.small,color: AppColors.black),
      ),
      appBarTheme:
           AppBarTheme(centerTitle: true, elevation: AppSizes.sz_8,backgroundColor:
          AppColors.mainColor),
      iconTheme: const IconThemeData(color: AppColors.iconColor),
      inputDecorationTheme: InputDecorationTheme(
          alignLabelWithHint: true,iconColor: AppColors.iconColor,
          contentPadding: const EdgeInsets.all(AppPadding.padding),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(AppSizes.circular1)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.mainColor),
              borderRadius: BorderRadius.circular(AppSizes.circular1)),
          // labelStyle: TextStyle(color: AppColors.mainColor),
          hintStyle: const TextStyle(color: AppColors.secondColor)),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()));
}
