import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lombard_ui/common/il_constants.dart';

class ILCheckBox extends StatefulWidget {
  const ILCheckBox({
    Key? key,
    required this.text,
    this.activeColor,
    this.checkColor,
  }) : super(key: key);

  final String text;
  final Color? activeColor;
  final Color? checkColor;

  @override
  State<ILCheckBox> createState() => _ILCheckBoxState();
}

class _ILCheckBoxState extends State<ILCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: widget.activeColor ?? ILColors.kPrimaryOrangeColor,
          checkColor: widget.checkColor ?? ILColors.kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Text(
          widget.text,
          style: ILTextStyles.kTitleRobotoRegular.copyWith(
            color: ILColors.kBlackColor,
            fontSize: ILSizeConfig.textMultiplier! * 4,
          ),
        ),
      ],
    );
  }
}
