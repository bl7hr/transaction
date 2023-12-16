import 'dart:ui';

import 'package:eygept/core/sizes_manager.dart';
import 'package:eygept/presentation/create_order/controller/create_order_controller.dart';
import 'package:eygept/presentation/login/screen/login-screen.dart';
import 'package:eygept/presentation/orders/controller/order_controller.dart';
import 'package:eygept/presentation/orders/model/order_model.dart';
import 'package:eygept/presentation/reports/controller/report_controller.dart';
import 'package:eygept/presentation/reports/view/report_screen.dart';
import 'package:eygept/services/cache_helper.dart';
import 'package:eygept/services/function.dart';
import 'package:eygept/widgets/default_button_widget.dart';
import 'package:eygept/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/color_manager.dart';
import '../../../widgets/cirular_widget.dart';
import '../../create_order/view/create_order_screen.dart';
import '../components/destination.dart';
import '../components/drivers.dart';
import '../components/item_order_component.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.put(OrderController());
    var scaffoldKey = GlobalKey<ScaffoldState>();
    Future<void> refresh() {
      orderController.getAllOrders();
      return Future.delayed(const Duration(seconds: 3));
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        key: scaffoldKey,
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.to(ReportScreen());
              },
              icon: Icon(Icons.edit_note_rounded)),
          actions: [
            IconButton(
                onPressed: () {
               warningMessage(context, title: 'تسجيل الخروج', body: 'هل انت متأكد من تسجيل الخروج',func: (){
                 CacheHelper.removeData(key: 'token');
                 CacheHelper.removeData(key: 'id');
                 Get.offAll(LoginScreen());
               });

                },
                icon: Icon(Icons.logout)),
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchStudent());
                },
                icon: Icon(Icons.search)),
          ],
          title: Text('الطلبات'),
        ),
        body: Obx(() {
          if (orderController.waitOrder.value)
            return circularProgres(function: (){orderController.getAllOrders();});
          return Directionality(
            textDirection: TextDirection.rtl,
            child: RefreshIndicator(
              onRefresh: refresh,
              child: ListView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: orderController.orderList.length,
                    itemBuilder: (BuildContext context, int i) {
                      return itemOrderComponent(
                          orderController.orderList[i], context);
                    },
                  ),
                  SizedBox(height: 70,)
                ],
              ),
            ),
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GetBuilder<OrderController>(
          init: OrderController(),
          builder: (controller) => FloatingActionButton.extended(
            elevation: 10,
            label: Text(controller.eventText),
            icon: Icon(Icons.add),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: AppColors.mainColor,
            onPressed: () {
              Get.to(CreateOrderScreen());
            },
          ),
        ),
      ),
    );
  }
}

class SearchStudent extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: Icon(Icons.arrow_back))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    OrderController controller = Get.put(OrderController());
    List<OrderModel> fillter = controller.orderList.where((element) {
      return element.driverName!.contains(query) ||
          element.traderName!.contains(query) ||
          element.id.toString().contains(query) ||
          element.goodsType!.contains(query);
    }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
          itemCount: query == "" ? controller.orderList.length : fillter.length,
          itemBuilder: (context, i) {
            return query == ""
                ? itemOrderComponent(controller.orderList[i], context)
                : itemOrderComponent(fillter[i], context);
          }),
    );
  }
}
