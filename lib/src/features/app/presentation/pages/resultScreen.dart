import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outshade_inter_assigment/src/conifg/utils/commonWidgets.dart';

import 'package:outshade_inter_assigment/src/features/app/data/models/localUserModel.dart';
import 'package:outshade_inter_assigment/src/features/app/presentation/viewModel/siginInViewModel.dart';

class ResultScreen extends StatelessWidget {
  LocalUserModel userModel;
  ResultScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);
  final _signInViewModel = Get.put(SignInViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResultWidget(text1: 'name :', result: userModel.name),
            ResultWidget(
                text1: 'gender :',
                result: userModel.gender == 'male' ? 'female' : 'male'),
            CommonWidgets.DefultButton(
              context,
              text: 'delete user',
              onPressed: () => _signInViewModel.deleteUser(userModel.name),
            )
          ],
        ),
      ),
    );
  }

  Widget ResultWidget({required String text1, required String result}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          result,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
