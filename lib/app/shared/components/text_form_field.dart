// ignore_for_file: must_be_immutable

import 'package:desafio_mobile_betalent/app/shared/domain/entities/app_theme_constants.dart';
import 'package:desafio_mobile_betalent/app/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatefulWidget {
  TextEditingController? controller;
  String? title;
  final String hint;
  final String? value;
  final String? Function(String?)? validator;
  Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  bool hideInput;
  bool textArea;
  Color? borderColor;
  void Function()? onTap;
  FocusNode? focusNode;
  Function(String)? onFieldSubmitted;
  TextInputAction? textInputAction;
  bool readOnly;
  Widget? suffixIcon;
  Widget? preffixIcon;

  AppTextFormField({
    super.key,
    this.controller,
    this.title,
    required this.hint,
    this.onChanged,
    this.value,
    this.validator,
    this.hideInput = false,
    this.textArea = false,
    this.borderColor,
    this.inputFormatters,
    this.keyboardType,
    this.onTap,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.readOnly = false,
    this.suffixIcon,
    this.preffixIcon,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _hideInput;

  @override
  void initState() {
    super.initState();
    _hideInput = widget.hideInput;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      initialValue: widget.value,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      obscureText: _hideInput,
      controller: widget.controller,
      cursorColor: widget.borderColor ?? context.colorScheme.surface,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.colorScheme.tertiaryContainer,
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.secondary,
          fontSize: AppThemeConstants.h3FontSize,
          fontWeight: FontWeight.w400,
        ),
        hintText: widget.hint,
        prefixIcon: widget.preffixIcon,
        suffixIcon: widget.hideInput
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _hideInput = !_hideInput;
                  });
                },
                icon: Icon(
                  !_hideInput ? Icons.visibility : Icons.visibility_off,
                  color: widget.borderColor ?? context.colorScheme.surface,
                ),
              )
            : widget.suffixIcon,
      ),
    );
  }
}
