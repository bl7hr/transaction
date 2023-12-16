// import 'dart:typed_data';
// import 'package:eygept/presentation/reports/components/theme.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
//
// import '../view/report_screen.dart';
// Future<Uint8List> generatePdf(format) async {
//   final doc = pw.Document(
//     title: 'تقرير',
//   );
//   final logoImage = pw.MemoryImage(
//       (await rootBundle.load('assets/images/logo.jpg')).buffer.asUint8List());
//   double height = 30;
//   double size = 10;
//   bool color(int i) {
//     if (i % 2 == 0)
//       return true;
//     else
//       return false;
//   }
//   String formattedDate = DateFormat('yyyy').format(DateTime.now());
//   String formattedDate2 = DateFormat('MM').format(DateTime.now());
//   String formattedDate3 = DateFormat('dd').format(DateTime.now());
//   final pageTheme = await myPageTheme(format);
//   doc.addPage(pw.MultiPage(
//       maxPages: 20,
//       pageTheme: pageTheme,
//       header: (final context) => pw.Column(
//           children: [
//             pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
//               pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.end,
//                   children: [
//                     pw.Text('  اسم المستخدم: ${controller.listReportModel[0].userName}'),
//
//                   ]),
//               pw.Image(
//                   alignment: pw.Alignment.topLeft,
//                   logoImage,
//                   fit: pw.BoxFit.contain,
//                   width: 120),
//             ]),
//             pw.Container(
//               decoration: pw.BoxDecoration(
//                 border: pw.Border(
//                   bottom: pw.BorderSide(
//                     color: PdfColor.fromHex('000055'),
//                     width: 1.0,
//                     style: pw.BorderStyle.dashed,
//                   ),
//                 ),
//               ),
//             ),
//             pw.SizedBox(height: 20)
//           ]),
//       footer: (final context) => pw.Column(
//         children: [
//           pw.Container(
//             decoration: pw.BoxDecoration(
//               border: pw.Border(
//                 bottom: pw.BorderSide(
//                   color: PdfColor.fromHex('000055'),
//                   width: 1.0,
//                   style: pw.BorderStyle.dashed,
//                 ),
//               ),
//             ),
//           ),
//           pw.Padding(
//               child: pw.Align(
//                 alignment: pw.Alignment.centerRight,
//                 child: pw.Text(
//                   'تم إنشاء هذا التقرير في: $formattedDate3-$formattedDate2-$formattedDate',
//                 ),
//               ),
//               padding: pw.EdgeInsets.all(20))
//         ],
//       ),
//       build: (final context) => [
//         pw.Container(
//             width: double.infinity,
//             child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.end,
//                 children: [
//                   pw.Center(
//                     child: pw.Padding(
//                       padding: const pw.EdgeInsets.all(8.0),
//                       child: pw.Container(
//                         decoration: pw.BoxDecoration(
//                             border: pw.Border.all(
//                                 color: PdfColor.fromHex('4472c3'),
//                                 width: 2)),
//                         child: pw.Directionality(
//                           textDirection: pw.TextDirection.rtl,
//                           child: pw.Table(
//                             border: pw.TableBorder(
//                               horizontalInside: pw.BorderSide(
//                                   width: 0.5,
//                                   color: PdfColor.fromHex(
//                                       '4472c3')), // تعيين إطارات الجانب العلوي والسفلي
//                             ),
//                             columnWidths: const <int, pw.TableColumnWidth>{
//                               0: pw.FlexColumnWidth(5),
//                               1: pw.FlexColumnWidth(5),
//                               2: pw.FlexColumnWidth(5),
//                               3: pw.FlexColumnWidth(5)
//                             },
//                             defaultVerticalAlignment:
//                             pw.TableCellVerticalAlignment.middle,
//                             children: <pw.TableRow>[
//                               pw.TableRow(
//                                 children: <pw.Widget>[
//
//
//                                   pw.Container(
//                                     height: height,
//                                     color: PdfColor.fromHex('4472c3'),
//                                     child: pw.Center(
//                                         child: pw.Text(
//                                           'اجمالي المسافة',
//                                           style: pw.TextStyle(
//                                               color: PdfColors.white,
//                                               fontSize: size),
//                                         )),
//                                   ),
//
//
//
//
//
//
//
//
//                                   pw.Container(
//                                     height: height,
//                                     color: PdfColor.fromHex('4472c3'),
//                                     child: pw.Center(
//                                         child: pw.Text(
//                                           'عدد الطلبات',                                              style: pw.TextStyle(
//                                             color: PdfColors.white,
//                                             fontSize: size),
//                                         )),
//                                   ),
//
//
//
//                                   pw.Container(
//                                     height: height,
//                                     color: PdfColor.fromHex('4472c3'),
//                                     child: pw.Center(
//                                         child: pw.Text(
//                                           'اسم السائق',
//                                           style: pw.TextStyle(
//                                               color: PdfColors.white,
//                                               fontSize: size),
//                                         )),
//                                   ),
//                                   // pw.Container(
//                                   //   height: height,
//                                   //   color: PdfColor.fromHex('4472c3'),
//                                   //   child: pw.Center(
//                                   //       child: pw.Text(
//                                   //         'رقم السائق',
//                                   //         style: pw.TextStyle(
//                                   //             color: PdfColors.white,
//                                   //             fontSize: size),
//                                   //       )),
//                                   // ),
//                                 ],
//                               ),
//                               for (int i = 0; i < controller.listReportModel.length; i++)
//
//                                 pw.TableRow(
//                                   decoration: const pw.BoxDecoration(
//                                     color: PdfColors.grey,
//                                   ),
//                                   children: <pw.Widget>[
//                                     pw.Container(
//                                       height: height,
//                                       color: color(i)
//                                           ? PdfColor.fromHex('d8e2f2')
//                                           : PdfColors.white,
//                                       child: pw.Center(
//                                           child: pw.Text(
//                                             '${controller.listReportModel[i].totalDistance}',
//                                             style: pw.TextStyle(
//                                                 color: PdfColors.black,
//                                                 fontSize: size),
//                                           )),
//                                     ),
//                                     pw.Container(
//                                       height: height,
//                                       color: color(i)
//                                           ? PdfColor.fromHex('d8e2f2')
//                                           : PdfColors.white,
//                                       child: pw.Center(
//                                           child: pw.Text(
//                                             '${controller.listReportModel[i].ordersCount}',
//                                             style: pw.TextStyle(
//                                                 color: PdfColors.black,
//                                                 fontSize: size),
//                                           )),
//                                     ),
//                                     pw.Container(
//                                       height: height,
//                                       color: color(i)
//                                           ? PdfColor.fromHex('d8e2f2')
//                                           : PdfColors.white,
//                                       child: pw.Center(
//                                           child: pw.Text(
//                                             '${controller.listReportModel[i].driverName}',
//                                             style: pw.TextStyle(
//                                                 color: PdfColors.black,
//                                                 fontSize: size),
//                                           )),
//                                     ),
//                                     // pw.Container(
//                                     //   height: height,
//                                     //   color: color(i)
//                                     //       ? PdfColor.fromHex('d8e2f2')
//                                     //       : PdfColors.white,
//                                     //   child: pw.Center(
//                                     //       child: pw.Text(
//                                     //         '${controller.listReportModel[i].driverId}',
//                                     //         style: pw.TextStyle(
//                                     //             color: PdfColors.black,
//                                     //             fontSize: size),
//                                     //       )),
//                                     // ),
//                                   ],
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // pw.SizedBox(height: 80),
//                   // pw.Padding(
//                   //   padding: pw.EdgeInsets.only(right: 40),
//                   //   child: pw.Column(children: [
//                   //     pw.Padding(padding: pw.EdgeInsets.all(8),child:  pw.Text('التوقيع:'),),
//                   //     // pw.GetBuilder<ReportController>(
//                   //     //
//                   //     //     builder: (controller){return pw.Column();}),
//                   //
//                   //     bytes1 != null
//                   //         ? pw.Container(
//                   //         height: 70,
//                   //         width: 100,
//                   //         child: pw.Image(pw.MemoryImage(
//                   //             bytes1!.buffer.asUint8List())))
//                   //         : pw.Container(
//                   //         height: 70,
//                   //         width: 100,
//                   //         decoration: pw.BoxDecoration(
//                   //             border: pw.Border.all(width: 0.5))),
//                   //
//                   //   ]),)
//                 ])),
//       ]));
//   return doc.save();
// }
//
