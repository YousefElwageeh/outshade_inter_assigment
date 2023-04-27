import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:outshade_inter_assigment/src/core/localDB/constants.dart';
import 'package:outshade_inter_assigment/src/features/app/data/models/localUserModel.dart';

class LocalDBRepoImplmenter {
  final LocalDB = Hive.box<LocalUserModel>(LocalDBConstants.BoxName);
  Either<Exception, LocalUserModel> GetUsersDataFromLocalDB(String userName) {
    try {
      print(LocalDB.get(userName)!);
      return Right(LocalDB.get(userName)!);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, void>> AddUserToLocalDB(
      String userName, LocalUserModel user) async {
    try {
      await LocalDB.put(userName, user);
      print('done');
      return const Right(Void);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, void>> DeleteUsersDataFromLocalDB(
      String userName) async {
    try {
      return Right(await LocalDB.delete(userName));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
