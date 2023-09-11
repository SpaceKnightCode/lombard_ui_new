import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_colors.dart';

class ILTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isPassword;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool? isMandatory;

  const ILTextField(
      {super.key,
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.isPassword,
      this.onChanged,
      this.validator,
      this.isMandatory = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: "$labelText${isMandatory == true ? "*" : ""}",
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: ILColors.kGreyColor2c2c2c,
        focusColor: ILColors.kGreyBorderPrimaryColor,
        iconColor: ILColors.kGreyBorderPrimaryColor,
        prefixIconColor: ILColors.kGreyBorderPrimaryColor,
        suffixIconColor: ILColors.kGreyBorderPrimaryColor,
        hoverColor: ILColors.kGreyColor2c2c2c,
        floatingLabelStyle: TextStyle(color: ILColors.kGreyBorderPrimaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ILColors.kGreyBorderPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ILColors.kGreyBorderPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
