import 'package:json_annotation/json_annotation.dart';

part 'info_user_model.g.dart';

@JsonSerializable()
class InfoUserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  double? height;
  double? weight;
  String? eyeColor;

  InfoUserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.maidenName,
      this.age,
      this.gender,
      this.email,
      this.phone,
      this.username,
      this.password,
      this.birthDate,
      this.image,
      this.bloodGroup,
      this.height,
      this.weight,
      this.eyeColor});

  factory InfoUserModel.fromJson(Map<String, dynamic> json) =>
      _$InfoUserModelFromJson(json);
      

  Map<String, dynamic> toJson() => _$InfoUserModelToJson(this);
}
