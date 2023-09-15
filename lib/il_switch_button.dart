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

  final bool? isCurved;
  final bool? hasShadow;
  final bool? isOn;
  final VoidCallback? onChanged;
  final bool? isDisabled;
  final bool? isEmptySwitch;

  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? textColor;

  const ILSwitchButton({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.isCurved = true,
    this.hasShadow = true,
    this.isOn = false,
    required this.onChanged,
    this.isDisabled = false,
    this.offText = "Off",
    this.onText = "On",
    this.textColor,
    this.textSize,
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
    _isOn = widget.isOn ?? false;
    _onText = widget.onText!;
    _offText = widget.offText!;

    if (widget.isEmptySwitch == true) {
      _onText = "";
      _offText = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(widget.isCurved! ? 15 : 0),
      elevation: !widget.isDisabled!
          ? widget.hasShadow!
              ? 3
              : 0
          : 0,
      color: Colors.transparent,
      shadowColor: ILColors.kGreyColorc3c3c3,
      child: GestureDetector(
        onTap: !widget.isDisabled!
            ? () {
                setState(() {
                  _isOn = !_isOn;
                  widget.onChanged!();
                });
              }
            : () {},
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: ILSizeConfig.blockSizeH * 3,
              vertical: ILSizeConfig.blockSizeH * 3),
          height: widget.height ?? ILSizeConfig.blockSizeH * 12,
          width: widget.width ?? ILSizeConfig.blockSizeH * 25,
          decoration: BoxDecoration(
            color: !widget.isDisabled!
                ? widget.backgroundColor ?? ILColors.kWhiteColor
                : ILColors.kGreyPrimaryColor,
            borderRadius: BorderRadius.circular(widget.isCurved! ? 15 : 0),
          ),

          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: _isOn
                      ? (widget.width ?? ILSizeConfig.blockSizeH * 25) -
                          ILSizeConfig.blockSizeH * 13
                      : 0,
                  right: _isOn
                      ? 0
                      : (widget.width ?? ILSizeConfig.blockSizeH * 25) -
                          ILSizeConfig.blockSizeH * 13,
                ),
                decoration: BoxDecoration(
                    color: !widget.isDisabled!
                        ? _isOn
                            ? widget.activeColor ?? ILColors.kPrimaryOrangeColor
                            : widget.inactiveColor ?? ILColors.kGreySwitchColor
                        : ILColors.kGreySwitchColor,
                    borderRadius: BorderRadius.circular(100)),
                height: ILSizeConfig.blockSizeH * 6,
                width: ILSizeConfig.blockSizeH * 6,
              ),
              _isOn
                  ? Container(
                      margin: EdgeInsets.only(
                        right: _isOn
                            ? (widget.width != null
                                ? widget.width! - ILSizeConfig.blockSizeH * 20
                                : ILSizeConfig.blockSizeH * 10)
                            : 0,
                      ),
                      child: Text(
                        _onText!,
                        style: ILTextStyles.kTitleRobotoBold.copyWith(
                          fontSize: widget.textSize ??
                              ILSizeConfig.textMultiplier * 4.5,
                          color: !widget.isDisabled!
                              ? widget.textColor ?? ILColors.kBlackColor
                              : ILColors.kGreySwitchColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(
                          left: _isOn
                              ? 0
                              : (widget.width != null
                                  ? widget.width! - ILSizeConfig.blockSizeH * 20
                                  : ILSizeConfig.blockSizeH * 10)),
                      child: Text(
                        _offText!,
                        style: ILTextStyles.kTitleRobotoBold.copyWith(
                          fontSize: widget.textSize ??
                              ILSizeConfig.textMultiplier * 4.5,
                          color: !widget.isDisabled!
                              ? widget.textColor ?? ILColors.kBlackColor
                              : ILColors.kGreySwitchColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ],
          ),

          // child: Row(
          //   mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     _isOn
          //         ? Container(
          //             color: Colors.red,
          //             width: (widget.width ?? ILSizeConfig.blockSizeH * 33) -
          //                 ILSizeConfig.blockSizeH * 18,
          //             margin:
          //                 EdgeInsets.only(right: ILSizeConfig.blockSizeH * 5),
          //             child: Text(
          //               _onText!,
          //               style: ILTextStyles.kTitleRobotoBold.copyWith(
          //                 fontSize: widget.textSize ??
          //                     ILSizeConfig.textMultiplier * 4.5,
          //                 color: !widget.isDisabled!
          //                     ? widget.textColor ?? ILColors.kBlackColor
          //                     : ILColors.kGreySwitchColor,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //           )
          //         : const SizedBox(),
          //     Container(
          //       decoration: BoxDecoration(
          //           color: !widget.isDisabled!
          //               ? _isOn
          //                   ? widget.activeColor ?? ILColors.kPrimaryOrangeColor
          //                   : widget.inactiveColor ?? ILColors.kGreySwitchColor
          //               : ILColors.kGreySwitchColor,
          //           borderRadius: BorderRadius.circular(100)),
          //       height: ILSizeConfig.blockSizeH * 6,
          //       width: ILSizeConfig.blockSizeH * 6,
          //     ),
          //     _isOn
          //         ? const SizedBox()
          //         : Container(
          //             color: Colors.red,
          //             width: (widget.width ?? ILSizeConfig.blockSizeH * 33) -
          //                 ILSizeConfig.blockSizeH * 23,
          //             margin:
          //                 EdgeInsets.only(left: ILSizeConfig.blockSizeH * 5),
          //             child: Text(
          //               _offText!,
          //               style: ILTextStyles.kTitleRobotoBold.copyWith(
          //                 fontSize: widget.textSize ??
          //                     ILSizeConfig.textMultiplier * 4.5,
          //                 color: !widget.isDisabled!
          //                     ? widget.textColor ?? ILColors.kBlackColor
          //                     : ILColors.kGreySwitchColor,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //           ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
