import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/color_manager.dart';
import '../../../core/icons_manager.dart';
import '../../../widgets/default_text_field.dart';
import '../controller/login-controller.dart';


class InputsLoginComponents extends StatelessWidget {
  const InputsLoginComponents({super.key});
  @override
  Widget build(BuildContext context) {
    LoginController controller=Get.put(LoginController());

    return SizedBox(

      width: double.infinity,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('اسم المستخدم:'),
             const SizedBox(height: 10,),
             myTextFormField(
                 validate: (value) {
                   if (value.isEmpty) {
                     return 'لا يمكن ان يكون اسم المستخدم فارغاً';
                   }
                 },
                 passcon: controller.userNameTextF, text: 'أدخل اسم المستخدم', prefix: Icons.account_circle_outlined),
            const SizedBox(height: 10,),
            Text( 'كلمة المرور:'),
            const SizedBox(height: 10,),
            GetBuilder<LoginController>(builder: (controller) {
              return myTextFormField(
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'لا يمكن ان تكون كلمة المرور فارغة';
                    }
                  },
                  suffixfunc: () {
                    controller.isEyeShow();
                  },
                  ispassword: controller.isShow ? false : true,
                  passcon: controller.passwordTextF,
                  text: 'أدخل كلمة المرور',
                  suffix: controller.isShow
                      ? AppIcons.visibility
                      : AppIcons.visibilityOff,
                  prefix: Icons.lock_outlined,
                  suffixColor:
                  controller.isShow ? AppColors.mainColor : null);
            }),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
