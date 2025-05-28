import 'package:dantown_clone/app/core/constants.dart';
import 'package:dantown_clone/app/features/auth/presentation/state/sign_up_screen_view_model.dart';
import 'package:dantown_clone/app/core/widgets/advance_button.dart';
import 'package:dantown_clone/app/core/widgets/dropdown_input.dart';
import 'package:dantown_clone/app/core/widgets/text_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final double padding = Constants.verticalSpacing;

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ISignUpScreenViewModel>();
    return ListView(
      children: [
        // username
        TextInput(
          textController: vm.userNameController,
          focusNode: vm.userNameFocusNode,
          label: "Username",
          hintText: "Enter your username",
          keyboardType: TextInputType.name,
          nextFocusNode: vm.firstNameFocusNode,
          padding: padding,
        ),

        // first name
        TextInput(
          textController: vm.firstNameController,
          focusNode: vm.firstNameFocusNode,
          label: "First name",
          hintText: "Enter your first name",
          keyboardType: TextInputType.name,
          nextFocusNode: vm.emailFocusNode,
          padding: padding,
        ),

        // email
        TextInput(
          textController: vm.emailController,
          focusNode: vm.emailFocusNode,
          label: "Email",
          hintText: "Enter your email address",
          keyboardType: TextInputType.emailAddress,
          nextFocusNode: vm.phoneNumberFocusNode,
          padding: padding,
        ),

        // phone number
        TextInput(
          textController: vm.phoneNumberController,
          focusNode: vm.phoneNumberFocusNode,
          label: "Phone number",
          hintText: "Enter your phone number",
          keyboardType: TextInputType.number,
          nextFocusNode: vm.passwordFocusNode,
          padding: padding,
        ),

        // password
        TextInput(
          textController: vm.passwordController,
          focusNode: vm.passwordFocusNode,
          label: "Password",
          hintText: "Enter your password",
          keyboardType: TextInputType.visiblePassword,
          nextFocusNode: vm.passwordFocusNode,
          padding: padding,
        ),

        // referral code
        TextInput(
          textController: vm.referralCodeController,
          focusNode: vm.referralCodeFocusNode,
          label: "Referral Code(Optional)",
          hintText: "Enter your referral code(Optional)",
          keyboardType: TextInputType.name,
          nextFocusNode: vm.referralCodeFocusNode,
          padding: padding,
        ),

        DropdownInput(
          label: "How did you hear about us?",
          options: ["Facebook", "Twitter", "Instagram", "Billboard", "Other"],
          selectedValue: null,
          padding: padding,
          onChanged: (value) {
            // Handle the selected value
            if (kDebugMode) {
              print("Selected referral source: $value");
            }
          },
        ),

        SizedBox(height: 20.h),

        AdvanceButton(label: "Sign up", onPressed: () => vm.signUp(context)),
      ],
    );
  }
}
