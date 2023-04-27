import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outshade_inter_assigment/src/features/app/data/models/localUserModel.dart';
import 'package:outshade_inter_assigment/src/features/app/data/models/usersModel.dart';
import 'package:outshade_inter_assigment/src/features/app/data/repositories/repo_Implmenter.dart';
import 'package:outshade_inter_assigment/src/features/app/data/repositories/repo_implmenter_local_DB.dart';
import 'package:outshade_inter_assigment/src/features/app/presentation/pages/resultScreen.dart';
import 'package:outshade_inter_assigment/src/features/app/presentation/widgets/signinWidget.dart';

class SignInViewModel extends GetxController {
  @override
  void onInit() {
    getUsersData();

    super.onInit();
  }

  RxBool isLoading = true.obs;
  RxString isMale = 'male'.obs;
  TextEditingController age = TextEditingController();

  RepoImplmenter repoImplmenter = RepoImplmenter();
  LocalDBRepoImplmenter localDBRepoImplmenter = LocalDBRepoImplmenter();

  UsersModel? UsersData;
  void getUsersData() {
    repoImplmenter.GetUsersData().then((value) =>
        value.fold((faluier) => printError(info: faluier.toString()), (data) {
          UsersData = data;
          isLoading.value = false;
        }));
  }

  void showTheDialog(context, String username, TextEditingController age) {
    var result = localDBRepoImplmenter.GetUsersDataFromLocalDB(username);
    result.fold((l) async {
      var usermodel = LocalUserModel(
        username,
        age.text,
        isMale.value,
      );
      isMale.value = '';
      await SignInWidgets.ShowSignInDialog(
        context,
        isMale,
        age,
        () {
          Get.back();
          localDBRepoImplmenter.AddUserToLocalDB(username, usermodel);

          Get.to(() => ResultScreen(userModel: usermodel));
        },
      );
    }, (data) {
      Get.to(() => ResultScreen(
            userModel: data,
          ));
    });
  }

  void deleteUser(String username) {
    localDBRepoImplmenter.DeleteUsersDataFromLocalDB(username)
        .then((value) => value.fold((l) => null, (data) => Get.back()));
  }
}
