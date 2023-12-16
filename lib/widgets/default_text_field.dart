
import '../core/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget myTextFormField({
  bool isKeyboard = true,
   TextEditingController? passcon,
  var ontap,
  var onChange,
  TextInputType type = TextInputType.text,
  var validate,
  required String text,
  required IconData prefix,
  var suffix,
  var suffixfunc,
  var suffixColor,
  bool ispassword = false,
  bool readOnly=false,
  int maxLines=1
}) =>
    TextFormField(
      onChanged: onChange,
      readOnly: readOnly,
      maxLines: maxLines,
      validator: validate,
      inputFormatters: [
        if(type==TextInputType.number)
          FilteringTextInputFormatter.digitsOnly
      ],
      onTap: ontap,
      controller: passcon,
      obscureText: ispassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        prefixIconColor: AppColors.mainColor,
        labelText: text,
        labelStyle: TextStyle(fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width:2,color: AppColors.secondColor,)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixfunc, icon: Icon(suffix),color:suffixColor ,)
            : null,

        //Icon(Icons.remove_red_eye)
      ),
      keyboardType: type,
    );
