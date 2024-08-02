import 'package:base_mvvm_cubit/data/models/reponse/credential_model.dart';
import 'package:base_mvvm_cubit/data/models/request/login_request.dart';
import 'package:base_mvvm_cubit/data/service/authen_service.dart';

sealed class AuthenRepository {
  Future<CredentialModel> loginApp(LoginRequest request);
}

class AuthenRepositoryImpl extends AuthenRepository {
  final AuthenService authenService;
  AuthenRepositoryImpl({required this.authenService});
  @override
  Future<CredentialModel> loginApp(LoginRequest request) async {
 try {
      final value = await authenService.loginApp(request);
      return value;
    } catch (_) {
      rethrow;
    }
  }
}
