import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:outshade_inter_assigment/src/core/api/dio_factory.dart';
import 'package:outshade_inter_assigment/src/core/localDB/constants.dart';
import 'package:outshade_inter_assigment/src/features/app/data/models/localUserModel.dart';
import 'package:outshade_inter_assigment/src/features/app/presentation/pages/signinPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalUserModelAdapter());
  await Hive.openBox<LocalUserModel>(LocalDBConstants.BoxName);
  DioFactory.getDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
