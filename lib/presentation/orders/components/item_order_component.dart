import 'package:eygept/presentation/create_order/view/create_order_screen.dart';
import 'package:eygept/presentation/orders/controller/order_controller.dart';
import 'package:eygept/presentation/orders/model/order_model.dart';
import 'package:eygept/services/function.dart';
import 'package:eygept/widgets/default_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../../core/color_manager.dart';
import '../../../core/sizes_manager.dart';
import '../../../main.dart';

Widget itemOrderComponent(OrderModel orderModel, context) {
  OrderController controller=Get.find<OrderController>();
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
    child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.circular1)),
        child: ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(

                    content: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        height: 220,
                          child: Directionality(textDirection: TextDirection.rtl,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: Text('${orderModel.driverName}',style: TextStyle(fontSize: 18,color: AppColors.mainColor),)),
                                Divider(thickness: 1,color: Colors.yellow.shade700,),
                                Text('  رقم السائق: ${orderModel.driverNumber}', style:textStyle()),
                                Text('  الحمل: ${orderModel.goodsType}', style:textStyle(),),
                                Text('  التاجر: ${orderModel.traderName}', style:textStyle(),),
                                Text('  التاريخ: ${orderModel.orderDate!.substring(0,10)} ',textAlign: TextAlign.right,style: textStyle(),),
                                Text('  الملاحظات: ${orderModel.note} ',textAlign: TextAlign.right,style: textStyle(),),

                                if(id==1)
                                SizedBox(
  width: double.infinity,
  height: 40,
  child:   Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [

      myBotton(function: (){
        Get.to(CreateOrderScreen(orderModel:orderModel));
      }, text: 'تعديل',background: AppColors.mainColor,width:100 ),

      myBotton(function: (){

        warningMessage(context, title: 'حذف الشحنة', body: 'هل انت متأكد من حذف الشحة؟',func: (){

          controller.  deleteOrder(context,orderModel.id);

        });
      }, text: 'حذف',background: Colors.red,width: 100),

    ],

  ),
)
                              ],
                            ),
                          )),
                    ),
                  );
                });
          },
          trailing:IconButton(onPressed: (){
            launchUrl(Uri.parse('https://wa.me/${orderModel.driverNumber}?text=عندك حمل: ${orderModel.goodsType} من: ${orderModel.traderName}'));
          },icon:  Icon(Icons.phone,color: Colors.yellow.shade700,size: 20,),),
          leading: Container(
            height: 50,
            width: 70,
            child: Center(
                child: Text(
              '${orderModel.goodsType}',
              style: TextStyle(color: AppColors.white, fontSize: 12),
              overflow: TextOverflow.ellipsis,
            )),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
                color: AppColors.mainColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(AppSizes.circular1)),
          ),
          title: Text('${orderModel.driverName}'),
          subtitle: Text(
            'الرقم: ${orderModel.id}        التاجر: ${orderModel.traderName}',
            style: TextStyle(fontSize: 12 ,color:AppColors.grey ),
          ),
        )),
  );
}TextStyle textStyle(){
  return  TextStyle(color: Color(0xff777777),fontSize: 14);
}
// Stack(
// alignment: AlignmentDirectional.topStart,
// children: [
//
// InkWell(onTap: (){
// showDialog(context: context, builder: (context){
// return AlertDialog(
// content: Directionality(textDirection: TextDirection.rtl,
// child: Container(
// height: 100,
// child:
// Center(child: Text('الملاحظات: ${orderModel.note} ',textAlign: TextAlign.right,style: TextStyle(fontSize: 14),))
//
// ),
// ),
// );
// });
// },
// child: Padding(
// padding: const EdgeInsets.only(top: 27),
// child: Container(
// decoration: BoxDecoration(boxShadow: [
// BoxShadow(
// color: AppColors.black.withOpacity(0.25),
//
// spreadRadius: 0,
// blurRadius: 2,
// offset: Offset(0, 3),
// ),
// ],
// color: AppColors.white,
// borderRadius: BorderRadius.circular(AppSizes.circular1)),
// height: 80,
// child:  Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Text('${orderModel.traderName}',style: TextStyle(fontSize: 12),),
// Text('${orderModel.orderDate!.substring(0,10)}',style: TextStyle(fontSize: 12),),
// ],
// ),
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// InkWell(onTap:(){
// launchUrl(Uri.parse('https://wa.me/${orderModel.driverNumber}?text=عندك حمل: ${orderModel.goodsType}'));
// }, child: Text('${orderModel.driverName}',style: TextStyle(color: Colors.green,fontSize: 12),)),
// Text('${orderModel.destName}',style: TextStyle(fontSize: 12),),
// ],
// ),
// ],
// ),
// ),
// ),
// ),Padding(
// padding: const EdgeInsets.symmetric(horizontal: 10.0),
// child: Container(
//
// width: 100,
// height: 37,
// decoration: BoxDecoration(
// boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.25),offset: Offset(2,3),blurRadius: 4)],
// color: AppColors.mainColor,
//
// borderRadius: BorderRadius.circular(AppSizes.circular1)),
// child: Center(child: Text('${orderModel.goodsType}',style: TextStyle(color: AppColors.white,fontSize: 12),))),
// ),
// ],
// ),
