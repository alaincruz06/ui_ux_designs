import 'package:flutter/material.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/common/app/theme/colors.dart';
import 'package:ui_ux_designs/src/common/app/theme/text_styles.dart';

class TasksDetailsTextFormField extends StatelessWidget {
  const TasksDetailsTextFormField({
    super.key,
    this.controller,
    this.autovalidateMode,
    this.focusNode,
    this.validator,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.disabledBorderColor,
    this.suffixIcon,
    this.error,
    this.helper,
  });

  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? hintText;
  final Color? disabledBorderColor;
  final Widget? suffixIcon;
  final Widget? error;
  final Widget? helper;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      validator: validator,
      cursorColor: TaskColors.taskColorTexts,
      maxLines: maxLines,
      minLines: minLines ?? ((maxLines ?? 1) > 1 ? 1 : null),
      onFieldSubmitted: (value) => onSubmitted,
      onChanged: onChanged,
      style: textStyleBody.apply(
        color: TaskColors.taskColorTexts,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16) +
            const EdgeInsets.symmetric(vertical: 8),
        filled: true,
        fillColor: TaskColors.taskColorTextFieldBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          borderSide: BorderSide(
            color: TaskColors.taskColorTextFieldBg,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          borderSide: BorderSide(
            color: TaskColors.taskColorTextFieldBg,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
          borderSide: BorderSide(
            color: TaskColors.taskColorTexts,
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
        error: error,
        helper: helper,
      ),
    );
  }
}
