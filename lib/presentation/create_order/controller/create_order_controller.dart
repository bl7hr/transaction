import 'package:eygept/presentation/orders/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/connect_api.dart';
import '../../../services/function.dart';
import '../../orders/controller/order_controller.dart';
import '../../orders/model/destination_model.dart';
import '../../orders/model/driver_model.dart';

class CreateOrderController extends GetxController{

  OrderController orderController=Get.find();
  List<DestinationModel> destinationList=[];
  TextEditingController goodsController=TextEditingController();
  TextEditingController merchantController=TextEditingController();
  TextEditingController noteController=TextEditingController();
  void clean(){
    goodsController.clear();
    merchantController.clear();
    noteController.clear();
    destinationModel=null;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  RxBool waitOrder=false.obs;
  RxBool waitDestination=false.obs;
/////
  DriverModel? driverModel;
  void onChangeDriverCompoBox(DriverModel temp){
    driverModel=temp;
    update();
  }

  DestinationModel? destinationModel;
  void onChangeDestinationModelCompoBox(DestinationModel temp){
    destinationModel=temp;
    update();
  }
  var formKey = GlobalKey<FormState>();
RxBool waitAddOrder=false.obs;
  void addOrder(context,numb,goods,merchant)async{
    waitAddOrder.value=true;
    await ApiServices().postData(url: 'Order', body:{

      "id": 1,
      "user_id": 2,
      "goods_type": goodsController.text,
      "trader_name":merchantController.text ,
      "driver_id": driverModel!.id!,
      "destination_id": 2,
      "order_date": '2020-11-11',
      "note": noteController.text==''?'لا يوجد':noteController.text
    }).then((value) {
      waitAddOrder.value=false;

      successMessage(context,func: (){
     launchUrl(Uri.parse('https://wa.me/${numb}?text=عندك حمل: ${goods} من: ${merchant}'));
      });
      // clean();
    }).catchError((e){
      waitAddOrder.value=false;

      errorMessage(context);});
  }

  void editOrder(context,id)async{
    await ApiServices().postData(url: 'Order/Update', body:{
      "id":id,
      "user_id": 2,
      "goods_type": goodsController.text,
      "trader_name":merchantController.text ,
      "driver_id":  driverModel!.id!,
      "destination_id":2,
      "order_date": '2020-11-11',
      "note": noteController.text==''?'لا يوجد':noteController.text
    }).then((value) {
      successMessage(context);
      clean();
    }).catchError((e){errorMessage(context);});
  }


}