import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';

class LabelFormField extends StatelessWidget {
  final String? hint;
  final double? height;
  final double fontSize;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextEditingController? tec;
  final bool? readOnly;
  final void Function()? onPressed;
  final void Function()? onFieldOnTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final int? lines;
  final Color? fillColor;
  final Color? borderColor;

  const LabelFormField({
    super.key,
    this.hint = "",
    this.fontSize = 12,
    this.maxLength,
    this.onFieldOnTap,
    this.height,
    this.keyboardType,
    this.tec,
    this.readOnly,
    this.onPressed,
    this.inputFormatters,
    this.textInputAction,
    this.validator,
    this.lines,
    this.fillColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: fillColor ?? AppColors.whiteColor,
        border: Border.all(
          color: borderColor?? AppColors.blackColor,
        ),
        borderRadius: BorderRadius.circular(06),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: hint!,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          TextFormField(
            controller: tec,
            showCursor: readOnly == true ? false : true,
            inputFormatters: inputFormatters,
            autocorrect: false,
            maxLength: maxLength,
            maxLines: lines ?? 1,
            readOnly: readOnly ?? false,
            focusNode: FocusNode(),
            cursorColor: AppColors.blackColor,
            style: GoogleFonts.inter(
              color: AppColors.fieldColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? AppColors.whiteColor,
              contentPadding: EdgeInsets.zero,
              isDense: true,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              hintText: hint!.toLowerCase(),
              hintStyle: GoogleFonts.inter(
                color: AppColors.fieldColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            validator: validator,
            onTap: onFieldOnTap,
          ),
        ],
      ),
    );
  }
}
