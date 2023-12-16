import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

successMessage(context, {String title = 'تم', String body = 'تم التنفيذ بنجاح',var func}) {
  return AwesomeDialog(
    context: context,
    dismissOnTouchOutside: false,
    animType: AnimType.leftSlide,
    headerAnimationLoop: false,
    dialogType: DialogType.success,
    title: title,
    desc:body,
    btnOkOnPress: func,
    btnOkText: 'موافق',
    btnOkIcon: Icons.check_circle,
  ).show();
}

  errorMessage(context, {String title = 'خطأ', String body = 'تأكد من المدخلات او من اتصالك بالانترنت'}) {
    return
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        headerAnimationLoop: false,
        title: title,
        desc:
        body,
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red,
        btnOkText: 'موافق'
      ).show();
  }
warningMessage(context, {required String title, required String body ,var func}) {
  return
    AwesomeDialog(
      btnOkText: 'متأكد',
      btnCancelText: 'إلغاء',
      width: 500,
      context: context,
      dialogType: DialogType
          .question,
      animType: AnimType
          .rightSlide,
      headerAnimationLoop: true,
      title: title,
      desc:body,
      btnOkOnPress:func ,
      btnCancelOnPress: () {

      },
    ).show();
}