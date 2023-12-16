import 'package:eygept/core/color_manager.dart';
import 'package:eygept/core/sizes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/function.dart';
import '../../../widgets/default_button_widget.dart';
import '../components/inputs-login-component.dart';
import '../controller/login-controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
    appBar:AppBar(title: const Text('اسم التطبيق'),),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(AppSizes.circular2),border: Border.all(width: 1,color: AppColors.mainColor) ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.circular2),
                      child: Image.asset(
                        'assets/images/logo.jpg',
                         height: 150,
                         width: 150,
                      ),
                    ),
                  ),
                ),

                const  InputsLoginComponents(),
                const SizedBox(
                  height: 15,
                ),
                Obx(() {
                  if (controller.wait.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return myBotton(
                        function: () {
                           if (controller.formKey.currentState!
                               .validate()) {
                             controller.login(context);
                           }
                        },
                        text: 'تسجيل الدخول');
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
