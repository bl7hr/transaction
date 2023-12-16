import 'package:eygept/presentation/reports/controller/report_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/color_manager.dart';
import '../components/theme.dart';

ByteData? bytes1;

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ReportController controller = Get.put(ReportController());
    return Scaffold(
        appBar: AppBar(
          title: Text('التقرير'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            if(controller.wait.value)
              return Center(child: CircularProgressIndicator());
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainColor)),
              child: SingleChildScrollView(
                  child: Table(
                    border: const TableBorder(
                      horizontalInside: BorderSide(
                          width: 0.5,
                          color: AppColors
                              .mainColor), // تعيين إطارات الجانب العلوي والسفلي
                    ),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(5),
                      1: FlexColumnWidth(5),
                      2: FlexColumnWidth(5),
                      3: FlexColumnWidth(5),
                      4: FlexColumnWidth(5),
                      5: FlexColumnWidth(5),
                      6: FlexColumnWidth(5),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                          decoration: const BoxDecoration(
                            color: AppColors.grey,
                          ),
                          children: [

                            titleTable('اجمالي الطلبات'),
                            titleTable('اسم السائق'),
                            titleTable('مسلسل'),

                          ]),
                      if(controller.listReportModel.isNotEmpty)
                        for(int i = 0; i <
                            controller.listReportModel.length; i++)
                          TableRow(
                              decoration: const BoxDecoration(
                                color: AppColors.grey,
                              ),

                              children: [
                                bodyTable('${controller.listReportModel[i]
                                    .ordersCount}', i),
                                bodyTable('${controller.listReportModel[i]
                                    .driverName}', i),

                                bodyTable('${i}', i),


                              ]),

                    ],
                  )

              ),
            );
          }),
        )
    );
  }
}


