import 'package:eygept/core/theme_manager.dart';
import 'package:eygept/presentation/login/screen/login-screen.dart';
import 'package:eygept/presentation/orders/screen/order_screen.dart';
import 'package:eygept/services/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? token;
int? id;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  token=await CacheHelper().getDataString(key: 'token');
  id=await CacheHelper().getDataInt(key: 'id');

  Widget widget;
  if(token==null)
    widget=LoginScreen();
  else
    widget = OrdersScreen();
  runApp( MyApp(widget: widget,));
}

class MyApp extends StatelessWidget {
   MyApp({super.key,required this.widget});
  Widget widget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),

      home:widget,
    );
  }
}
