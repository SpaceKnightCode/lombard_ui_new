import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';

enum IconPosition { left, right }

class ILTextButton extends StatelessWidget {
  final String text;
  final bool? isFullWidth;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isCurved;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final bool? hasBorder;
  final Color? borderColor;
  final IconData? icon;
  final IconPosition? iconPosition;
  final double? textSize;
  final FontWeight? fontWeight;
  final EdgeInsets? contentPadding;

  const ILTextButton({
    super.key,
    required this.text,
    this.backgroundColor = ILColors.kPrimaryOrangeColor,
    required this.onPressed,
    this.textColor = Colors.white,
    this.isCurved = false,
    this.height,
    this.width,
    this.hasBorder = false,
    this.borderColor,
    this.icon,
    this.iconPosition = IconPosition.left,
    this.isFullWidth = false,
    this.textSize,
    this.fontWeight,
    this.contentPadding,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: isFullWidth! ? double.infinity : width,
        height: height,
        padding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: ILSizeConfig.blockSizeH * 4,
              vertical: ILSizeConfig.blockSizeV * 1.5,
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isCurved! ? 30 : 10),
          color: backgroundColor ?? Theme.of(context).primaryColor,
          border: borderColor != null || hasBorder!
              ? Border.all(color: borderColor ?? Colors.orange, width: 1.5)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null && iconPosition == IconPosition.left)
              Row(
                children: [
                  Icon(
                    icon,
                    color: textColor,
                  ),
                  SizedBox(
                    width: ILSizeConfig.blockSizeH,
                  ),
                ],
              ),
            Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontSize: textSize ?? ILSizeConfig.textMultiplier * 3.5,
                  fontWeight: fontWeight ?? FontWeight.w600),
            ),
            if (icon != null && iconPosition == IconPosition.right)
              Row(
                children: [
                  Icon(
                    icon,
                    color: textColor,
                  ),
                  SizedBox(
                    width: ILSizeConfig.blockSizeH,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
