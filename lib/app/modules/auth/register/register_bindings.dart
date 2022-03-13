import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/data/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger_mobile/app/domain/repositories/i_auth_repository.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthRepository>(
      () => AuthRepository(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut(() => RegisterController(authRepository: Get.find()));
  }
}
