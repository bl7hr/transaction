import 'package:eygept/services/connect_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/report_model.dart';
import 'dart:ui' as ui;
class ReportController extends GetxController{

  List<ReportModel> listReportModel=[];
  @override
  void onInit() {
    super.onInit();
    getReports();
  }
RxBool wait=false.obs;
  void getReports()async{
wait.value=true;
    await ApiServices().getData(url: 'Order/OrdersReport').then((value) {
      print(value.body);
      for(int i=0;i<value.body.length;i++)
        {
          listReportModel.add(ReportModel.fromJson(value.body[i]));
        }
      wait.value=false;

    }).catchError((e){
      wait.value=false;

    });
  }

}