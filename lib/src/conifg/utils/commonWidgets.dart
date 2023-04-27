import 'package:flutter/material.dart';
import 'package:outshade_inter_assigment/src/conifg/theme/colorManger.dart';

import '../theme/valuseManger.dart';

class CommonWidgets {
  static Widget DefultButton(BuildContext context,
      {required String text, required void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: AppSize.s50,
            width: AppSize.s120,
            decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(AppSize.s25),
            ),
            child: MaterialButton(
                onPressed: onPressed,
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: ColorManager.scaffoldBackgroundColor),
                )),
          ),
        ],
      ),
    );
  }

  static Widget DefultTextFormField({
    required String label,
    TextEditingController? textEditingController,
  }) {
    return SizedBox(
      width: 60,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,

          // errorText: _loginViewModel.isUserNameVaild.value
          //     ? null
          //     : AppStrings.usernameError.tr
        ),
      ),
    );
  }
}
