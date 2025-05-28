import 'package:d_crypto_lite/app/core/constants.dart';
import 'package:d_crypto_lite/app/features/auth/presentation/state/login_screen_view_model.dart';
import 'package:d_crypto_lite/app/core/widgets/advance_button.dart';
import 'package:d_crypto_lite/app/core/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          padding: Constants.padding,
          textController: vm.emailController,
          focusNode: vm.emailFocusNode,
          label: "Email",
          hintText: "Enter your email address",
          keyboardType: TextInputType.emailAddress,
          nextFocusNode: vm.passwordFocusNode,
        ),

        TextInput(
          padding: Constants.padding,
          textController: vm.passwordController,
          focusNode: vm.passwordFocusNode,
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
        SizedBox(height: 15.h),

        AdvanceButton(label: "Login", onPressed: () => vm.login(context)),
      ],
    );
  }
}
