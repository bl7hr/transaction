import 'package:eygept/main.dart';
import 'package:eygept/presentation/login/screen/login-screen.dart';
import 'package:eygept/presentation/orders/model/destination_model.dart';
import 'package:eygept/presentation/orders/model/driver_model.dart';
import 'package:eygept/presentation/orders/model/order_model.dart';
import 'package:eygept/services/connect_api.dart';
import 'package:eygept/services/function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  List<DriverModel> driverList=[];

  List<OrderModel> orderList=[];
  void getAllDrivers()async{
    waitDriver.value=true;
    await ApiServices().getData(url: 'driver').then((value) {
      for(int i=0;i<value.body.length;i++)
      {
        driverList.add(DriverModel.fromJson(value.body[i]));
      }
      waitDriver.value=false;
      update();
    }).catchError((e){});

    //  getDriverToEdit();
  }
  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit;
  String eventText = 'إضافة شحنة';
  @override
  void onInit() {
    super.onInit();
    getAllDrivers();
    getAllOrders();
  }
  void changeFloatButton(bool isShow, IconData iconData, String txt) {
    isBottomSheetShow = isShow;
    eventText = txt;
    fabIcon = iconData;
    update();
  }


  RxBool waitDriver=false.obs;
  RxBool waitOrder=false.obs;
  RxBool waitDestination=false.obs;

  void getAllOrders()async{
    orderList=[];
    waitOrder.value=true;

    await ApiServices().getData(url: 'Order/OrdersView').then((value) {
      for(int i=0;i<value.body.length;i++)
      {
        orderList.add(OrderModel.fromJson(value.body[i]));

      }
      waitOrder.value=false;
      update();
    }).catchError((e){
      Get.to(LoginScreen());
    });
  }

  void deleteOrder(context,id)async{

    await ApiServices().postData(url: 'Order/Delete', body: {
"id":id
    }).then((value) {

      getAllOrders();

      successMessage(context,body: 'تم حذف الطلب بنجاح',func: (){
        Get.back();});
    }).catchError((e){

errorMessage(context);
    });
  }

}