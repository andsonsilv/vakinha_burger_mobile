import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/common/constants/texts_constant.dart';
import 'package:vakinha_burger_mobile/app/core/exceptions/user_notfound_exeception.dart';
import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/data/models/user_model.dart';
import 'package:vakinha_burger_mobile/app/domain/repositories/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final RestClient _restClient;

  AuthRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      var message = TextsConstant.erroAoRegistrarUsuario;
      if (result.statusCode == 400) {
        message = result.body[TextsConstant.error];
      }

      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException(message);
    }
    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('auth/', {
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          TextsConstant.usuarioOuSenhaInvalidos,
          error: result.statusCode,
          stackTrace: StackTrace.current,
        );
        throw UserNotfoundExeception();
      }
      log(
        TextsConstant.erroAoAutenticarUsuario + '(${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException(TextsConstant.erroAoAutenticarUsuario);
    }
    return UserModel.fromMap(result.body);
  }
}
