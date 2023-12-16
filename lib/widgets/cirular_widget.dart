
import 'package:flutter/material.dart';

import '../core/color_manager.dart';

Widget circularProgres({var function}){

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        TextButton(
            onPressed: function,
            child: Text(
                ' إعادة التحميل', style:TextStyle(color:  AppColors.secondColor))),
      ],
    ),
  );

}