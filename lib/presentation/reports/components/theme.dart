//
// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// Future<pw.PageTheme> myPageTheme(format) async {
//   var arabicFont = pw.Font.ttf(await rootBundle.load("assets/fonts/t.ttf"));
//
//   return pw.PageTheme(
//     theme: pw.ThemeData.withFont(
//       base: arabicFont,
//     ),
//     margin: const pw.EdgeInsets.symmetric(
//         horizontal: 1 * PdfPageFormat.cm, vertical: 0.5 * PdfPageFormat.cm),
//     orientation: pw.PageOrientation.portrait,
//     textDirection: pw.TextDirection.rtl,
//
//   );
// }
//
//

import 'package:flutter/material.dart';

import '../../../core/color_manager.dart';

Widget titleTable(String txt) {
  return Container(
    height: 32,
    color: AppColors.mainColor,
    child: Center(
        child: Text(
          txt,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.white, fontSize: 10),
        )),
  );
}

Widget bodyTable(String txt, int clr) {
  return Container(
    height: 32,
    color: clr % 2 == 0 ? Color(0xffd8def2)
        : Color(0xffffffff),
    child: Center(
        child: Text(
          txt,
          style: TextStyle(color:AppColors.black, fontSize: 10),
          textAlign: TextAlign.center,
        )),
  );
}
