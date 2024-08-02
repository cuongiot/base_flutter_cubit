import 'package:base_mvvm_cubit/data/models/reponse/credential_model.dart';
import 'package:base_mvvm_cubit/data/models/reponse/info_user_model.dart';
import 'package:base_mvvm_cubit/data/models/request/login_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'authen_service.g.dart';

@RestApi()
abstract class AuthenService {
  factory AuthenService(Dio dio, {String baseUrl}) = _AuthenService;

  @POST("auth/login")
  Future<CredentialModel> loginApp(
    @Body() LoginRequest request,
  );

  @GET("auth/me")
  Future<InfoUserModel> fetchInfoUser();
}
