import 'package:eygept/core/color_manager.dart';
import 'package:eygept/core/sizes_manager.dart';
import 'package:eygept/presentation/create_order/controller/create_order_controller.dart';
import 'package:eygept/presentation/orders/controller/order_controller.dart';
import 'package:eygept/presentation/orders/model/destination_model.dart';
import 'package:eygept/presentation/orders/model/driver_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/decoration_drop_down.dart';

Widget destinationCompoBox() {
  return GetBuilder<CreateOrderController>(builder: (controller) {
    return Container(
      width: double.infinity,
      height: 47,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.circular1),
          border: Border.all(color: AppColors.grey)),
      child: DropdownButton<DestinationModel>(hint: decorationDropDownButton(
          icn: Icons.arrow_forward, title: 'اختر الوجهة'),
        value: controller.destinationModel,

        items: controller.destinationList
            .map<DropdownMenuItem<DestinationModel>>((DestinationModel value) {
          return DropdownMenuItem<DestinationModel>(
            alignment: AlignmentDirectional.centerEnd,
            value: value,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: AppColors.mainColor,
                    ),
                  ),
                  //   const SizedBox(width: 5,),
                  Text(
                    '${value.name} ${value.distance}', style: const TextStyle(
                      color: AppColors.black),
                  ),
                ],
              ),
            ),
          );
        }).toList(), onChanged: (DestinationModel? value) {
          controller.onChangeDestinationModelCompoBox(value!);
        },),
    );
  });
}