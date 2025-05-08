import 'package:flutter/material.dart';

abstract class ISignUpScreenViewModel extends ChangeNotifier {
  TextEditingController get emailController;
  TextEditingController get passwordController;
  TextEditingController get userNameController;
  TextEditingController get firstNameController;
  TextEditingController get phoneNumberController;
  TextEditingController get referralCodeController;

  FocusNode get emailFocusNode;
  FocusNode get passwordFocusNode;
  FocusNode get userNameFocusNode;
  FocusNode get firstNameFocusNode;
  FocusNode get phoneNumberFocusNode;
  FocusNode get referralCodeFocusNode;

  Future<void> signUp(BuildContext context);
}

class SignUpScreenViewModel extends ChangeNotifier implements ISignUpScreenViewModel {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _referralCodeFocusNode = FocusNode();

  @override
  TextEditingController get emailController => _emailController;

  @override
  TextEditingController get passwordController => _passwordController;

  @override
  TextEditingController get userNameController => _userNameController;

  @override
  TextEditingController get firstNameController => _firstNameController;

  @override
  TextEditingController get phoneNumberController => _phoneNumberController;

  @override
  TextEditingController get referralCodeController => _referralCodeController;

  @override
  FocusNode get emailFocusNode => _emailFocusNode;

  @override
  FocusNode get passwordFocusNode => _passwordFocusNode;

  @override
  FocusNode get userNameFocusNode => _userNameFocusNode;

  @override
  FocusNode get firstNameFocusNode => _firstNameFocusNode;

  @override
  FocusNode get phoneNumberFocusNode => _phoneNumberFocusNode;

  @override
  FocusNode get referralCodeFocusNode => _referralCodeFocusNode;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    _firstNameController.dispose();
    _phoneNumberController.dispose();
    _referralCodeController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _userNameFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _referralCodeFocusNode.dispose();

    super.dispose();
  }

  @override
  Future<void> signUp(BuildContext context) async {
    print("Button Tapped");
  }
}
