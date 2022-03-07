import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/common/constants/texts_constant.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: Column(
        children: const [
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: VakinhaTextformfield(label: 'text Form',),
          ),
          SizedBox(height: 20,),
          VakinhaButton(onPressed: null, label: TextsConstant.entrar)
        ],
      ),
    );
  }
}
