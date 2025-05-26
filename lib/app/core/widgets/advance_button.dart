import 'package:d_crypto_lite/app/core/constants.dart';
import 'package:d_crypto_lite/app/core/theme.dart';
import 'package:flutter/material.dart';

class AdvanceButton extends StatefulWidget {
  final void Function()? onPressed;
  final String label;
  const AdvanceButton({super.key, this.onPressed, required this.label});

  @override
  State<AdvanceButton> createState() => _AdvanceButtonState();
}

class _AdvanceButtonState extends State<AdvanceButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        minimumSize: Size(double.infinity, 10),
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Constants.borderRadius)),
      ),
      child: Text(
        widget.label,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
