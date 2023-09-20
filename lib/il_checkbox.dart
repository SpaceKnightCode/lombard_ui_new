import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lombard_ui/common/il_constants.dart';

class ILCheckBox extends StatefulWidget {
  ILCheckBox({
    Key? key,
    required this.text,
    this.activeColor,
    this.checkColor,
    required this.onChanged,
    this.isDisabled,
  }) : super(key: key);

  final String text;
  final Color? activeColor;
  final Color? checkColor;
  final void Function(bool) onChanged;
  final bool? isDisabled;
  bool isSelected = false;
  bool getSelection() {
    return isSelected;
  }

  @override
  State<ILCheckBox> createState() => _ILCheckBoxState();
}

class _ILCheckBoxState extends State<ILCheckBox> {
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
          value: widget.isSelected,
          onChanged: (value) {
            widget.onChanged(value!);

            setState(() {
              widget.isSelected = value!;
            });
          },
        ),
        Text(
          widget.text,
          style: ILTextStyles.kTitleRobotoRegular.copyWith(
            color: ILColors.kBlackColor,
            fontSize: ILSizeConfig.textMultiplier * 4,
          ),
        ),
      ],
    );
  }
}
