import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:lombard_ui/common/il_colors.dart';

class ILRadioButton extends StatefulWidget {
  const ILRadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeBackgroundColor,
    this.height,
    this.width,
    this.hasBorder,
    this.borderColor,
    this.activeBorderColor,
    this.titleColor,
    this.backgroundColor,
    this.isDisabled,
    this.isCurved = true,
    this.subtitle,
    this.isRecommended = false,
    this.subtitleColor,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final bool? isRecommended;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final Color? activeBackgroundColor;
  final double? height;
  final double? width;
  final bool? hasBorder;
  final Color? borderColor;
  final Color? activeBorderColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? backgroundColor;
  final bool? isDisabled;
  final bool? isCurved;

  @override
  State<ILRadioButton> createState() => _ILRadioButtonState();
}

class _ILRadioButtonState extends State<ILRadioButton> {
  @override
  Widget build(BuildContext context) {
    const Color kSecondaryOrangeColor = Color(0xfff5e7e1);

    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.value != widget.groupValue) {
              widget.onChanged(widget.value);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: ILSizeConfig.blockSizeV),
            decoration: BoxDecoration(
              color: widget.value == widget.groupValue
                  ? widget.activeBackgroundColor ?? kSecondaryOrangeColor
                  : widget.backgroundColor ??
                      (widget.isRecommended ?? false
                          ? Colors.white
                          : Colors.transparent),
              borderRadius:
                  BorderRadius.circular(widget.isCurved ?? false ? 12 : 0),
              border: Border.all(
                color: widget.value == widget.groupValue
                    ? widget.activeBorderColor ?? ILColors.kBorderOrange
                    : widget.borderColor ?? ILColors.kGreyColorc3c3c3,
              ),
            ),
            height: widget.isRecommended ?? false
                ? widget.height ?? ILSizeConfig.blockSizeV * 8
                : widget.height ?? ILSizeConfig.blockSizeV * 6,
            width: widget.width,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Radio(
                    activeColor: widget.activeBackgroundColor ??
                        ILColors.kPrimaryOrangeColor,
                    value: widget.value,
                    onChanged: (value) {
                      widget.onChanged(value);
                    },
                    groupValue: widget.groupValue,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: ILSizeConfig.blockSizeH * 6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          widget.title,
                          style: ILTextStyles.kTitleRobotoBold.copyWith(
                            fontSize: ILSizeConfig.textMultiplier * 4,
                            color: widget.titleColor ?? ILColors.kBlackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      widget.subtitle == null
                          ? Container()
                          : Container(
                              margin: EdgeInsets.only(
                                  top: ILSizeConfig.blockSizeV * 0.6),
                              child: Text(
                                widget.subtitle ?? "",
                                style: TextStyle(
                                  color: widget.subtitleColor ??
                                      ILColors.kGreyColor2c2c2c,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        widget.isRecommended ?? false
            ? Container(
                padding: EdgeInsets.all(3),
                height: ILSizeConfig.blockSizeV * 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ILColors.kPrimaryOrangeColor,
                ),
                child: Text("Recommended",
                    style: ILTextStyles.kTitleRobotoRegular.copyWith(
                      fontSize: ILSizeConfig.textMultiplier * 2.2,
                      color: Colors.white,
                    )))
            : SizedBox(),
      ],
    );
  }
}
