import 'package:eygept/core/color_manager.dart';
import 'package:eygept/presentation/create_order/controller/create_order_controller.dart';
import 'package:eygept/presentation/orders/controller/order_controller.dart';
import 'package:eygept/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/default_button_widget.dart';
import '../../orders/components/destination.dart';
import '../../orders/components/drivers.dart';
import '../../orders/model/order_model.dart';

class CreateOrderScreen extends StatelessWidget {
  CreateOrderScreen({super.key, this.orderModel});

  OrderModel? orderModel;

  @override
  Widget build(BuildContext context) {
    String txtButton = 'إضافة';
    CreateOrderController controller = Get.put(CreateOrderController());
    OrderController orderController = Get.find();
    if (orderModel != null) {
      txtButton = 'تعديل';
      controller.goodsController.text = orderModel!.goodsType!;
      controller.noteController.text = orderModel!.note!;
      controller.merchantController.text = orderModel!.traderName!;
      for (int i = 0; i < orderController.driverList.length; i++) {
        if (orderController.driverList[i].id == orderModel!.driverId) {
          print(orderController.driverList[i].id);
          controller.driverModel = orderController.driverList[i];
          break; // Add this to exit the loop once the match is found
        }
      }
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: Text('إضافة شحنة'),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(offset: Offset(2, 2),
                        color: AppColors.black.withOpacity(0.25),
                        blurRadius: 3),
                    BoxShadow(offset: Offset(-2, -1),
                        color: AppColors.black.withOpacity(0.25),
                        blurRadius: 3)
                  ],
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(3)),
              // color: AppColors.white.withOpacity(0.7), // جعل اللون شبه شفاف

              child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Center(child: Text(
                        'املأ الحقول لإضافة شحنة', style: TextStyle(
                          fontSize: 18),)),
                      Divider(thickness: 1,),
                      Text('نوع البضاعة:',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                      myTextFormField(
                          passcon: controller.goodsController,
                          text: 'ادخل نوع البضاعة',
                          prefix: Icons.category),
                      Text('اسم التاجر:',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                      myTextFormField(
                          passcon: controller.merchantController,
                          text: 'ادخل اسم التاجر',
                          prefix: Icons.store),
                      Text(
                          'اسم السائق:',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                      Obx(() {
                        if (orderController
                            .waitDriver.value)
                          return Center(
                              child: CircularProgressIndicator());
                        return driverCompoBox();
                      }),
                      // Text('الوجهة:', style: Theme
                      //     .of(context)
                      //     .textTheme
                      //     .bodySmall),
                      // Obx(() {
                      //   if (controller
                      //       .waitDestination.value)
                      //     return Center(
                      //         child: CircularProgressIndicator());
                      //   return destinationCompoBox();
                      // }),
                      Text('ملاحظات:',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                      myTextFormField(
                          passcon: controller.noteController,
                          text: 'اي ملاحظات؟',
                          prefix: Icons.store), SizedBox(height: 15,),
                      Obx(() {
                        if(controller.waitAddOrder.value)
                          return Center(child: CircularProgressIndicator());
                        return myBotton(function: () {
                          txtButton == 'إضافة' ? controller.addOrder(
                              context, controller.driverModel!.number,
                              controller.goodsController.text,controller.merchantController.text) : controller
                              .editOrder(context, orderModel!.id);
                        }, text: txtButton);
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
