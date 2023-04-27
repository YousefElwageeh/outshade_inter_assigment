import 'package:hive/hive.dart';
part 'localUserModel.g.dart';

@HiveType(typeId: 0)
class LocalUserModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  @HiveField(2)
  final String gender;
  LocalUserModel(
    this.name,
    this.age,
    this.gender,
  );
}
