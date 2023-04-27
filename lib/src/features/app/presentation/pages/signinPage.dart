import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outshade_inter_assigment/src/conifg/theme/colorManger.dart';
import 'package:outshade_inter_assigment/src/features/app/data/repositories/repo_Implmenter.dart';
import 'package:outshade_inter_assigment/src/features/app/presentation/viewModel/siginInViewModel.dart';
import 'package:outshade_inter_assigment/src/features/app/presentation/widgets/signinWidget.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  RepoImplmenter p = RepoImplmenter();
  final _signInViewModel = Get.put(SignInViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => _signInViewModel.isLoading.value
          ? Center(
              child:
                  CircularProgressIndicator(color: ColorManager.primaryColor),
            )
          : ScreenContent(),
    ));
  }

  Widget ScreenContent() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    SignInWidgets.informationWidget(
                      context,
                      usersModel: _signInViewModel.UsersData?.users[index],
                      onPressed: () async => _signInViewModel.showTheDialog(
                          context,
                          _signInViewModel.UsersData?.users[index].name ?? '',
                          _signInViewModel.age),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: _signInViewModel.UsersData?.users.length ?? 0),
          ),
        ),
      ],
    );
  }
}
