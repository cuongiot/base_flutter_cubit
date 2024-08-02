import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
    @JsonKey(name: 'username')
  final String? userName;
    @JsonKey(name: 'password')
  final String? passWord;
  const LoginRequest({  this.userName, this.passWord});
  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
