import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isSuffixIcon;
  final bool isObscure;
  final Widget? widget;
  final String Function(String?)? validator;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isSuffixIcon = false,
    this.isObscure = false,
    this.widget,
    this.validator,
    required this.controller,
    this.onChanged,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: widget.isObscure ? !isObscureText : isObscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: !widget.isSuffixIcon
            ? widget.widget
            : IconButton(
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },

                icon: Icon(
                  !isObscureText
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                ),
              ),
      ),
    );
  }
}
