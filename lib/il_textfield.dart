import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_colors.dart';

class ILTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
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
        prefixIcon: Icon(Icons.person),
        suffixIcon: Icon(Icons.person),
        fillColor: ILColors.kGreyColor2c2c2c,
        focusColor: Colors.red,
        hoverColor: ILColors.kGreyColor2c2c2c,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ILColors.kGreyColor2c2c2c),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
