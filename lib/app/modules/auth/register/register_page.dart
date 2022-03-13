import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/common/constants/texts_constant.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

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
              key: _formKey,
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
                  VakinhaTextformfield(
                    label: TextsConstant.nome,
                    controller: _nameEC,
                    validator:
                        Validatorless.required(TextsConstant.nomeObrigatorio),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  VakinhaTextformfield(
                    label: TextsConstant.email,
                    controller: _emailEC,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(TextsConstant.emailObrigatorio),
                        Validatorless.email(TextsConstant.emailInvalido),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  VakinhaTextformfield(
                    label: TextsConstant.senha,
                    controller: _passwordEC,
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(TextsConstant.senhaObrigatorio),
                        Validatorless.min(6,
                            TextsConstant.senhaDeveConterPeloMenos6Caracteres),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  VakinhaTextformfield(
                    label: TextsConstant.confirmaSenha,
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(TextsConstant.confirmaSenha),
                        Validatorless.compare(_passwordEC,
                            TextsConstant.senhaDiferenteDeConfirmaSenha),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: VakinhaButton(
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          controller.register(
                              name: _nameEC.text,
                              email: _emailEC.text,
                              password: _passwordEC.text);
                        }
                      },
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
