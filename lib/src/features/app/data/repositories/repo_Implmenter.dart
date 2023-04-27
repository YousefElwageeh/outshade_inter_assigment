import 'package:dartz/dartz.dart';
import 'package:outshade_inter_assigment/src/core/api/Constant&endPoints.dart';
import 'package:outshade_inter_assigment/src/core/api/dio_factory.dart';
import 'package:outshade_inter_assigment/src/core/api/statuescodes.dart';
import 'package:outshade_inter_assigment/src/features/app/data/models/usersModel.dart';

class RepoImplmenter {
  Future<Either<Exception, UsersModel>> GetUsersData() async {
    var response = await DioFactory.getdata(url: EndPoints.data);
    print(response.statusCode);
    if (response.statusCode == StatusCodes.SuccessCode) {
      return Right(UsersModel.fromJson(response.data));
    } else {
      return Left(Exception());
    }
  }
}
