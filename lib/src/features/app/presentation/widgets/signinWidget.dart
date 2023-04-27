import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outshade_inter_assigment/src/conifg/theme/colorManger.dart';
import 'package:outshade_inter_assigment/src/conifg/utils/commonWidgets.dart';
import 'package:outshade_inter_assigment/src/features/app/data/models/usersModel.dart';

class SignInWidgets {
  static Widget informationWidget(context,
      {required User? usersModel, required void Function()? onPressed}) {
    return Row(
      children: [
        Text(
          usersModel?.name ?? '',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        CommonWidgets.DefultButton(context,
            text: 'Sign In', onPressed: onPressed)
      ],
    );
  }

  static Future<void> ShowSignInDialog(context, RxString isMale,
      TextEditingController age, void Function()? onPressed) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fill the following'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('chooce your gender'),
                Obx(
                  () => Row(
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                              activeColor: ColorManager.primaryColor,
                              value: isMale.value,
                              groupValue: 'male',
                              onChanged: (value) {
                                isMale.value = 'male';
                                print(isMale.value);
                              }),
                          const Text('male')
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                              activeColor: ColorManager.primaryColor,
                              value: isMale.value,
                              groupValue: 'female',
                              onChanged: (value) {
                                isMale.value = 'female';
                                print(isMale.value);
                              }),
                          const Text('female')
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonWidgets.DefultTextFormField(
                    label: 'Enter Your Age', textEditingController: age),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: onPressed,
              child: Text(
                'Approve',
                style: TextStyle(
                  color: ColorManager.primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
