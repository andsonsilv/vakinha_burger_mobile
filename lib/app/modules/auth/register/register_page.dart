import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/common/constants/texts_constant.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextsConstant.cadastro,
                    style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      TextsConstant.preenchaOsCamposAbaixoParaCriarSeuCadastro,
                      style: context.textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const VakinhaTextformfield(label: TextsConstant.nome),
                  const SizedBox(
                    height: 20,
                  ),
                  const VakinhaTextformfield(label: TextsConstant.email),
                  const SizedBox(
                    height: 20,
                  ),
                  const VakinhaTextformfield(label: TextsConstant.senha),
                  const SizedBox(
                    height: 20,
                  ),
                  const VakinhaTextformfield(
                      label: TextsConstant.confirmaSenha),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: VakinhaButton(
                      onPressed: null,
                      label: TextsConstant.cadastrar.toUpperCase(),
                      width: context.width,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
