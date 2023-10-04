import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_colors.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:lombard_ui_new/il_text_button.dart';

class ILOneButtonPopUp extends StatelessWidget {
  final String title;
  final Widget? content;
  final String? description;
  final String? buttonText;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? titleColor;
  final Color? descriptionColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? titleSize;
  final double? descriptionSize;
  final double? buttoHeight;
  final double? buttonWidth;
  final Widget? icon;
  final TextAlign? textAlign;

  const ILOneButtonPopUp(
      {super.key,
      required this.title,
      this.content,
      this.description,
      this.buttonText,
      this.onPressed,
      this.buttonColor,
      this.titleColor,
      this.descriptionColor,
      this.backgroundColor,
      this.height,
      this.width,
      this.titleSize,
      this.descriptionSize,
      this.buttoHeight,
      this.buttonWidth,
      this.icon,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor ?? ILColors.kWhiteColor,
      contentPadding: EdgeInsets.symmetric(vertical: 20),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: icon ?? SizedBox(),
                  margin: icon != null
                      ? EdgeInsets.only(right: 5)
                      : EdgeInsets.zero,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: titleColor ?? ILColors.kOrangeTextColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Divider(
              color: ILColors.kGreyColorc3c3c3,
            ),
            const SizedBox(
              height: 10,
            ),
            content ?? const SizedBox(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description ?? '',
                textAlign: textAlign ?? TextAlign.center,
                style: TextStyle(
                    color: descriptionColor ?? ILColors.kGreyColor454545,
                    fontSize:
                        descriptionSize ?? ILSizeConfig.textMultiplier * 3.5),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ILTextButton(
                backgroundColor: buttonColor ?? ILColors.kPrimaryOrangeColor,
                text: buttonText ?? "Dismiss",
                textSize: 20,
                width: buttonWidth ?? ILSizeConfig.blockSizeH * 36,
                height: buttoHeight ?? ILSizeConfig.blockSizeV * 6,
                onPressed: onPressed ?? Navigator.of(context).pop),
          ],
        ),
      ),
    );
  }
}
