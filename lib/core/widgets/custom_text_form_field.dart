import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.isPassword = false,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.keyboardType,
    this.suffixWidget,
    this.prefixIcon,
    this.prefix,
    this.action,
    this.focusNode,
    this.borderRadius,
    this.enabled,
    this.hintStyle,
    this.obscureText,
  });

  final TextEditingController? controller;
  final bool isPassword;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final Widget? suffixWidget;
  final Widget? prefixIcon;
  final Widget? prefix;
  final TextInputAction? action;
  final FocusNode? focusNode;
  final BorderRadius? borderRadius;
  final bool? enabled;
  final TextStyle? hintStyle;
  final bool? obscureText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  void _toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;

    final borderRadius = widget.borderRadius ?? BorderRadius.circular(8);

    OutlineInputBorder? updateBorder(InputBorder? border) {
      if (border is! OutlineInputBorder) {
        return null;
      }

      return border.copyWith(borderRadius: borderRadius);
    }

    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      textInputAction: widget.action ?? TextInputAction.next,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: theme.textTheme.bodyMedium,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? theme.textTheme.bodySmall,
        prefixIcon: widget.prefixIcon == null
            ? null
            : IconTheme(
                data: IconThemeData(color: theme.iconTheme.color),
                child: widget.prefixIcon!,
              ),
        prefix: widget.prefix == null
            ? null
            : IconTheme(
                data: IconThemeData(color: theme.iconTheme.color),
                child: widget.prefixIcon!,
              ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _toggleObscureText,
                color: Colors.black87,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : widget.suffixWidget,
        border: updateBorder(inputTheme.border),
        enabledBorder: updateBorder(inputTheme.enabledBorder),
        focusedBorder: updateBorder(inputTheme.focusedBorder),
        errorBorder: updateBorder(inputTheme.errorBorder),
        focusedErrorBorder: updateBorder(inputTheme.focusedErrorBorder),
        disabledBorder: updateBorder(inputTheme.disabledBorder),
      ),
      obscureText: widget.isPassword
          ? obscureText
          : widget.obscureText ?? false,
    );
  }
}
