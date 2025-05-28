import 'package:dantown_clone/app/core/constants.dart';
import 'package:dantown_clone/app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A styled text input field with label and optional password visibility toggle.
///
/// Supports validation, keyboard type customization, and focus management.
///
/// Used for form fields throughout the app.
class TextInput extends StatefulWidget {
  final TextEditingController textController;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final double padding;

  const TextInput({
    super.key,
    required this.textController,
    required this.focusNode,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    required this.nextFocusNode,
    required this.padding,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: widget.padding.h),
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        TextFormField(
          controller: widget.textController,
          keyboardType: widget.keyboardType,
          obscureText: obscureText,
          validator: widget.validator,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hintText,
            hintStyle: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: AppColors.secondaryColor),
            suffixIcon:
                widget.keyboardType == TextInputType.visiblePassword
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF9e9e9e),
                      ),
                    )
                    : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Constants.borderRadius),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Constants.borderRadius),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
