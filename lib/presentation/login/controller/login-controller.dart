import 'package:eygept/presentation/orders/screen/order_screen.dart';
import 'package:eygept/services/function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../../services/cache_helper.dart';
import '../../../services/connect_api.dart';
import '../model/login-model.dart';

class LoginController extends GetxController {
  var userNameTextF = TextEditingController();
  var passwordTextF = TextEditingController();
  bool isShow = false;
  var formKey = GlobalKey<FormState>();

  void isEyeShow() {
    isShow = !isShow;
    update();
  }

  bool isRemember = true;

  void rememberMe() {
    isRemember = !isRemember;
    update();
  }

  LoginModel? loginModel;

  RxBool wait = false.obs;

  void login(context) async {
   try {
     wait.value = true;

     await ApiServices().postData(url: 'login', body: {
       "id": 1,
       "user_name": userNameTextF.text,
       "password": passwordTextF.text,
       "name": "<string>",
       "token": "<string>"
     }).then((value) {
        try {
loginModel=LoginModel.fromJson(value.body);
token=loginModel!.value!.token;
id=loginModel!.value!.id;
           CacheHelper.saveData(key: 'token', value: token);
           CacheHelper.saveData(key: 'id', value: id);

      Get.off(OrdersScreen());
       } finally {
         wait.value = false;
        passwordTextF.clear();
        userNameTextF.clear();
       }
     });
   } catch (e) {
errorMessage(context);
wait.value = false;
   }
  }
}
