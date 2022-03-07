import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/common/constants/texts_constant.dart';
import 'package:vakinha_burger_mobile/app/routes/splash_routers.dart';

void main() {
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TextsConstant.vakinhaBurger,
      getPages: [
        ...SplashRouters.routers,
      ],
    );
  }
}

