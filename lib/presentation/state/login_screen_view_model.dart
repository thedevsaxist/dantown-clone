import 'package:d_crypto_lite/core/routes.dart';
import 'package:d_crypto_lite/domain/entities/login_entity.dart';
import 'package:d_crypto_lite/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class ILoginScreenViewModel extends ChangeNotifier {
  TextEditingController get emailController;
  TextEditingController get passwordController;

  FocusNode get emailFocusNode;
  FocusNode get passwordFocusNode;

  Future<void> login(BuildContext context);
}

class LoginScreenViewModel extends ChangeNotifier implements ILoginScreenViewModel {
  final LoginUsecase _loginUsecase;

  LoginScreenViewModel(this._loginUsecase);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  TextEditingController get emailController => _emailController;

  @override
  FocusNode get emailFocusNode => _emailFocusNode;

  @override
  TextEditingController get passwordController => _passwordController;

  @override
  FocusNode get passwordFocusNode => _passwordFocusNode;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Future<void> login(BuildContext context) async {
    final isLoggedIn = _loginUsecase.login(
      LoginEntity(email: _emailController.text.trim(), password: _passwordController.text.trim()),
    );

    if (isLoggedIn) {
      context.go(Routes.dashboard);
    }
  }
}
