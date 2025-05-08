import 'package:d_crypto_lite/presentation/state/login_screen_view_model.dart';
import 'package:d_crypto_lite/presentation/widgets/advance_button.dart';
import 'package:d_crypto_lite/presentation/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.read<ILoginScreenViewModel>();
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
