import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_colors.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:lombard_ui/common/il_size_config.dart';

class ILSwitchButton extends StatefulWidget {
  final String? offText;
  final String? onText;
  final double? height;
  final double? width;
  final double? textSize;

  final bool? isRounded;
  final bool? hasShadow;
  final bool? isOn;
  final ValueChanged<bool>? onChanged;
  final bool? isDisabled;
  final bool? isSwitched;
  final bool? isEmptySwitch;

  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeShadowColor;
  final Color? inactiveShadowColor;
  final Color? textColor;
  final Color? indicatorColor;

  const ILSwitchButton({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.isRounded = true,
    this.hasShadow,
    this.isOn,
    this.onChanged,
    this.isDisabled,
    this.offText = "Off",
    this.onText = "On",
    this.activeShadowColor,
    this.inactiveShadowColor,
    this.textColor,
    this.textSize,
    this.indicatorColor,
    this.isSwitched,
    this.isEmptySwitch = false,
  });

  @override
  State<ILSwitchButton> createState() => _ILSwitchButtonState();
}

class _ILSwitchButtonState extends State<ILSwitchButton> {
  bool _isOn = false;
  String? _onText;
  String? _offText;
  @override
  void initState() {
    _isOn = widget.isSwitched ?? false;
    _onText = widget.onText!;
    _offText = widget.offText!;
    String letter = " ";
    if (widget.isEmptySwitch == true) {
      _onText = "  ";
      _offText = "  ";
    } else if (_onText!.length - _offText!.length == 0) {
    } else if (_onText!.length - _offText!.length < 0) {
      int difference = _offText!.length - _onText!.length;
      _onText = _onText! + List.filled(difference, letter).join('');
    } else {
      int difference = _onText!.length - _offText!.length;
      _offText = List.filled(difference, letter).join('') + _offText!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(widget.isRounded! ? 15 : 0),
      elevation: 2,
      color: Colors.transparent,
      shadowColor: _isOn
          ? widget.activeShadowColor ?? Colors.grey
          : widget.inactiveShadowColor ?? Colors.grey,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isOn = !_isOn;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: ILSizeConfig.blockSizeH * 4,
              vertical: ILSizeConfig.blockSizeH * 3),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? ILColors.kWhiteColor,
            borderRadius: BorderRadius.circular(widget.isRounded! ? 15 : 0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isOn
                  ? Container(
                      margin:
                          EdgeInsets.only(right: ILSizeConfig.blockSizeH * 5),
                      child: Text(
                        _onText!,
                        style: ILTextStyles.kTitleRobotoBold.copyWith(
                          fontSize: widget.textSize ??
                              ILSizeConfig.textMultiplier * 4.5,
                          color: widget.textColor ?? ILColors.kBlackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : SizedBox(),
              Container(
                decoration: BoxDecoration(
                    color: _isOn
                        ? widget.activeColor ?? ILColors.kPrimaryOrangeColor
                        : widget.inactiveColor ?? ILColors.kGreyColor,
                    borderRadius: BorderRadius.circular(100)),
                height: ILSizeConfig.blockSizeH * 6,
                width: ILSizeConfig.blockSizeH * 6,
              ),
              _isOn
                  ? SizedBox()
                  : Container(
                      margin:
                          EdgeInsets.only(left: ILSizeConfig.blockSizeH * 5),
                      child: Text(
                        _offText! + "",
                        style: ILTextStyles.kTitleRobotoBold.copyWith(
                          fontSize: widget.textSize ??
                              ILSizeConfig.textMultiplier * 4.5,
                          color: widget.textColor ?? ILColors.kBlackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
