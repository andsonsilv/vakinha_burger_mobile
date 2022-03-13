import 'package:vakinha_burger_mobile/app/data/models/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel> login(String email, String password);

  Future<UserModel> register(String name, String email, String password);
}
