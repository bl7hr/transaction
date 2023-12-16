import 'package:eygept/core/color_manager.dart';
import 'package:flutter/material.dart';

import '../core/sizes_manager.dart';

Widget decorationDropDownButton({required IconData icn,required String title}){
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icn ,
            color: AppColors.mainColor,
          ),
        ),
        SizedBox(
          width: 5,
        ),
       Text(
             '$title',style: TextStyle(color: Colors.grey[700],fontSize: 14),),
      ],
    ),
  );
}