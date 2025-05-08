import 'package:d_crypto_lite/presentation/state/sign_up_screen_view_model.dart';
import 'package:d_crypto_lite/presentation/widgets/advance_button.dart';
import 'package:d_crypto_lite/presentation/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.read<ISignUpScreenViewModel>();
    return Column(
      children: [
        TextInput(
          textController: vm.emailController,
          focusNode: vm.emailFocusNode,
          label: "Email",
          hintText: "Enter your email address",
          keyboardType: TextInputType.emailAddress,
          nextFocusNode: vm.passwordFocusNode,
        ),

        const SizedBox(height: 30),

        TextInput(
          textController: vm.emailController,
          focusNode: vm.emailFocusNode,
          label: "Password",
          hintText: "Enter your password",
          keyboardType: TextInputType.visiblePassword,
          nextFocusNode: vm.passwordFocusNode,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot password",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),

        AdvanceButton(label: "Login", onPressed: () => vm.login(context)),
      ],
    );
  }
}
