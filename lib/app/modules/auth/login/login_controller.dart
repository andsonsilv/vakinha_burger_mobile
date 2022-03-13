import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/common/constants/keys_constant.dart';
import 'package:vakinha_burger_mobile/app/core/common/constants/texts_constant.dart';
import 'package:vakinha_burger_mobile/app/core/exceptions/user_notfound_exeception.dart';
import 'package:vakinha_burger_mobile/app/core/miixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/miixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/domain/repositories/i_auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final IAuthRepository _iAuthRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({
    required IAuthRepository authRepository,
  }) : _iAuthRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loading.toggle();
      final userLogged = await _iAuthRepository.login(email, password);
      final storage = GetStorage();
      storage.write(KeysConstant.USER_KEY, userLogged.id);
      _loading.toggle();
    } on UserNotfoundExeception catch (e, s) {
      _loading.toggle();
      log(TextsConstant.loginInvalido, error: e, stackTrace: s);
      _message(
        MessageModel(
          title: TextsConstant.error,
          message: TextsConstant.loginInvalido,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log(TextsConstant.erroAoRealizarLogin, error: e, stackTrace: s);
      _message(
        MessageModel(
          title: TextsConstant.error,
          message: TextsConstant.erroAoRealizarLogin,
          type: MessageType.error,
        ),
      );
    }
  }
}
