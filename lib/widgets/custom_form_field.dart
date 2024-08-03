import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';

class CustomFormField extends StatelessWidget {
  final String? hint;
  final double? height;
  final Color? fillColor;
  final double fontSize;
  final double contentPadding;
  final double? iconSize;
  final double? iconPaddingRight;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextEditingController? tec;
  final bool? isSelected;
  final bool? showPassword;
  final bool? obscureText;
  final bool? readOnly;
  final void Function()? onFieldOnTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final int? lines;
  final Color? borderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double borderRadius;

  const CustomFormField({
    super.key,
    this.hint = "",
    this.fontSize = 14,
    this.contentPadding = 14,
    this.iconPaddingRight,
    this.maxLength,
    this.iconSize,
    this.onFieldOnTap,
    this.showPassword,
    this.obscureText,
    this.height,
    this.keyboardType,
    this.tec,
    this.readOnly,
    this.isSelected,
    this.inputFormatters,
    this.textInputAction,
    this.validator,
    this.fillColor,
    this.lines,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: tec,
      showCursor: readOnly == true ? false : true,
      inputFormatters: inputFormatters,
      autocorrect: false,
      maxLength: maxLength,
      obscureText: obscureText ?? false,
      maxLines: lines ?? 1,
      readOnly: readOnly ?? false,
      cursorColor: AppColors.blackColor,
      style: GoogleFonts.inter(
        color: AppColors.blackColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor?? AppColors.greyColor.withOpacity(0.1),
        contentPadding: EdgeInsets.symmetric(
          horizontal: contentPadding,
          vertical: contentPadding,
        ),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.greyColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.greyColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.greyColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          color: AppColors.fieldColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
        errorStyle: GoogleFonts.inter(
          color: Colors.red,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      onTap: onFieldOnTap,
    );
  }
}
