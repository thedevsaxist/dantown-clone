import 'package:dantown_clone/app/core/constants.dart';
import 'package:dantown_clone/app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A styled dropdown input widget for selecting from a list of string options.
///
/// Includes a label, optional indicator, and customizable padding.
///
/// Notifies parent widgets of selection changes via [onChanged].
class DropdownInput extends StatefulWidget {
  final String label;
  final List<String> options;
  final String? selectedValue;
  final double padding;
  final ValueChanged<String?> onChanged;

  const DropdownInput({
    super.key,
    required this.label,
    required this.options,
    this.selectedValue,
    required this.padding,
    required this.onChanged,
  });

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  String? currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: widget.padding.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "Optional",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        DropdownButtonFormField<String>(
          value: currentValue,
          hint: Text("Select your response"),
          items:
              widget.options
                  .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
          onChanged: (value) {
            setState(() {
              currentValue = value;
            });
            widget.onChanged(value);
          },
          dropdownColor: Colors.white,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintStyle: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: AppColors.secondaryColor),
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
