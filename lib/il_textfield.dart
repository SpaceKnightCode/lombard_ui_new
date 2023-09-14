import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_colors.dart';
import 'package:lombard_ui/common/il_constants.dart';

class ILTextField extends StatelessWidget {
  final double? height;
  final double? width;

  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? emptyErrorMessage;

  final bool? isEnabled;
  final bool? isCurved;
  final bool? isFilled;
  final bool? isPassword;
  final bool? isMandatory;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapOutside;
  final VoidCallback? onTap;

  final double? textSize;
  final double? labelSize;
  final double? hintSize;
  final double? floatingLabelSize;

  final int? maxLength;
  final int? minLength;

  final Color? textColor;
  final Color? fillColor;
  final Color? borderColor;
  final Color? labelColor;
  final Color? floatingLabelColor;
  final Color? prefixColor;
  final Color? suffixColor;
  final Color? hintColor;
  final Color? cursorColor;

  final Color? focusedBorderColor;
  final Color? focusedPrefixColor;
  final Color? focusedSuffixColor;

  final Color? disabledLabelColor;
  final Color? disabledPrefixColor;
  final Color? disabledSuffixColor;

  ILTextField({
    super.key,
    this.height,
    this.width,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.onChanged,
    this.isMandatory = false,
    this.isCurved = true,
    this.controller,
    this.fillColor = ILColors.kGreyColor,
    this.textColor = ILColors.kBlackColor,
    this.emptyErrorMessage = "Please enter a valid value",
    this.borderColor = ILColors.kGreyColorc3c3c3,
    this.labelColor = ILColors.kGreyColor585858,
    this.floatingLabelColor = ILColors.kGreyColor585858,
    this.prefixColor = ILColors.kGreyColor585858,
    this.suffixColor = ILColors.kGreyColor585858,
    this.hintColor = ILColors.kGreyColorc3c3c3,
    this.cursorColor = ILColors.kGreyBorderPrimaryColor,
    this.focusedBorderColor = ILColors.kGreyBorderPrimaryColor,
    this.focusedPrefixColor = ILColors.kGreyColor585858,
    this.focusedSuffixColor = ILColors.kGreyColor585858,
    this.disabledLabelColor = ILColors.kGreyColorc3c3c3,
    this.disabledPrefixColor = ILColors.kGreyColorc3c3c3,
    this.disabledSuffixColor = ILColors.kGreyColorc3c3c3,
    this.isFilled = false,
    this.isEnabled = true,
    this.textSize,
    this.labelSize,
    this.hintSize,
    this.maxLength,
    this.minLength,
    this.floatingLabelSize,
    this.onTapOutside,
    this.onTap,
  });

  FocusNode focusNode = FocusNode();

  @override
  build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        maxLength: maxLength,
        minLines: minLength,
        style: TextStyle(
          color: textColor,
          fontSize: textSize ?? ILSizeConfig.textMultiplier * 4.5,
        ),
        focusNode: focusNode,
        obscureText: isPassword == true ? true : false,
        controller: controller,
        enabled: isEnabled!,
        onChanged: (value) {
          onChanged!(value);
        },
        cursorColor: cursorColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: hintSize ?? ILSizeConfig.textMultiplier * 4.5,
            color: hintColor,
          ),
          labelText: "${labelText}${isMandatory == true ? "*" : ""}",
          labelStyle: TextStyle(
            fontSize: labelSize ?? ILSizeConfig.textMultiplier * 4.5,
            color: isEnabled! ? labelColor : disabledLabelColor,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconColor: isEnabled!
              ? !focusNode.hasFocus
                  ? prefixColor
                  : focusedPrefixColor
              : disabledLabelColor,
          suffixIconColor: isEnabled ?? true
              ? !focusNode.hasFocus
                  ? suffixColor
                  : focusedSuffixColor
              : disabledSuffixColor,
          floatingLabelStyle: TextStyle(
            fontSize: floatingLabelSize ?? ILSizeConfig.textMultiplier * 4.5,
            color: floatingLabelColor,
          ),
          filled: !isEnabled!,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: isCurved!
                ? BorderRadius.circular(10)
                : BorderRadius.circular(0),
            borderSide: BorderSide(
              color: borderColor!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: isCurved!
                ? BorderRadius.circular(10)
                : BorderRadius.circular(0),
            borderSide: BorderSide(
              color: focusedBorderColor!,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: isCurved!
                ? BorderRadius.circular(10)
                : BorderRadius.circular(0),
            borderSide: BorderSide(color: fillColor!),
          ),
        ),
        onTap: onTap,
        onTapOutside: (value) {
          if (controller == null || controller!.text.isEmpty) {
            onTapOutside;
            focusNode.unfocus();
          }
        },
      ),
    );
  }
}
