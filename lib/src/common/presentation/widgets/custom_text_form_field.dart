import 'package:flutter/material.dart';
import 'package:ui_ux_designs/src/common/app/theme/colors.dart';
import 'package:ui_ux_designs/src/common/app/theme/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.enabled = true,
    this.controller,
    this.enableSuggestions = true,
    this.showCounter,
    this.autocorrect = true,
    this.autovalidateMode,
    this.keyboardType,
    this.focusNode,
    this.validator,
    this.obscureText = false,
    this.textCapitalization,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.disabledBorderColor,
    this.suffixIcon,
    this.prefixIcon,
    this.error,
    this.helper,
    this.scrollPadding =
        const EdgeInsets.all(20.0), //same default value as original component
  });

  final bool enabled;
  final TextEditingController? controller;
  final bool enableSuggestions;
  final bool autocorrect;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool? showCounter;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? hintText;
  final Color? disabledBorderColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? error;
  final Widget? helper;
  final EdgeInsets scrollPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: scrollPadding,
      enabled: enabled,
      controller: controller,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      autovalidateMode: autovalidateMode,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      keyboardType: keyboardType,
      focusNode: focusNode,
      textInputAction: textInputAction ?? TextInputAction.next,
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.black,
      maxLines: maxLines,
      minLines: minLines ?? ((maxLines ?? 1) > 1 ? 1 : null),
      onFieldSubmitted: (value) => onSubmitted,
      onChanged: onChanged,
      maxLength: maxLength,
      style: textStyleHeadline.apply(
        color: enabled ? Colors.black : AppColors.grey600,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16) +
            const EdgeInsets.symmetric(vertical: 8),
        filled: true,
        fillColor: enabled ? Colors.white : AppColors.grey150,
        counter: showCounter != null && showCounter!
            ? null
            : const SizedBox.shrink(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          borderSide: const BorderSide(
            color: AppColors.grey200,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          borderSide: const BorderSide(
            color: AppColors.grey200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          borderSide: const BorderSide(
            color: AppColors.grey400,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          borderSide: const BorderSide(
            color: AppColors.redFlag,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          borderSide: const BorderSide(
            color: AppColors.redFlag,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          borderSide: BorderSide(
            color: disabledBorderColor ?? AppColors.grey150,
          ),
        ),
        hintStyle: textStyleHeadline.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.grey600,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        error: error,
        helper: helper,
      ),
    );
  }
}
