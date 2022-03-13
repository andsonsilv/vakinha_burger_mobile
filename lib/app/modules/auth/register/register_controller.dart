import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/common/constants/texts_constant.dart';
import 'package:vakinha_burger_mobile/app/core/miixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/miixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/domain/repositories/i_auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final IAuthRepository _iAuthRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required IAuthRepository authRepository,
  }) : _iAuthRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      // TODO: voltar quando fizer o login
      Get.back();
      await _iAuthRepository.register(name, email, password);
      _loading.toggle();
      _message(
        MessageModel(
          title: TextsConstant.sucesso,
          message: TextsConstant.cadastroRealizadoComSucesso,
          type: MessageType.info,
        ),
      );
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log(
        TextsConstant.erroAoRegistrarUsuario,
        error: e,
        stackTrace: s,
      );
      _message(
        MessageModel(
          title: TextsConstant.error,
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log(
        TextsConstant.erroAoRegistrarUsuario,
        error: e,
        stackTrace: s,
      );
      _message(
        MessageModel(
          title: TextsConstant.error,
          message: TextsConstant.erroAoRegistrarUsuario,
          type: MessageType.error,
        ),
      );
    }
  }
}
