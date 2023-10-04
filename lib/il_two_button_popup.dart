import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_colors.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:lombard_ui_new/il_text_button.dart';

class ILTwoButtonPopUp extends StatelessWidget {
  final String title;
  final Widget? content;
  final String? description;
  final String? firstButtonText;
  final String? secondButtonText;
  final VoidCallback? onPressed;
  final Color? firstButtonColor;
  final Color? secondButtonColor;
  final Color? titleColor;
  final Color? descriptionColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? titleSize;
  final double? descriptionSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final Widget? icon;
  final TextAlign? textAlign;
  final EdgeInsets? buttonTextPadding;
  final EdgeInsets? contentPadding;
  final EdgeInsets? textPadding;

  const ILTwoButtonPopUp(
      {super.key,
      required this.title,
      this.content,
      this.description,
      this.onPressed,
      this.titleColor,
      this.descriptionColor,
      this.backgroundColor,
      this.height,
      this.width,
      this.titleSize,
      this.descriptionSize,
      this.buttonHeight,
      this.buttonWidth,
      this.icon,
      this.textAlign,
      this.firstButtonText,
      this.secondButtonText,
      this.firstButtonColor,
      this.secondButtonColor,
      this.buttonTextPadding,
      this.contentPadding,
      this.textPadding});

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
            Padding(
              padding:
                  contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
              child: content ?? const SizedBox(),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: textPadding ?? EdgeInsets.symmetric(horizontal: 20),
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ILTextButton(
                      backgroundColor: firstButtonColor ?? ILColors.kWhiteColor,
                      text: firstButtonText ?? "Canafefcel",
                      textColor: secondButtonColor ?? ILColors.kOrangeTextColor,
                      borderColor:
                          secondButtonColor ?? ILColors.kOrangeTextColor,
                      textSize: 20,
                      contentPadding: buttonTextPadding ??
                          EdgeInsets.symmetric(horizontal: 0),
                      width: buttonWidth ?? ILSizeConfig.blockSizeH * 30,
                      height: buttonHeight ?? ILSizeConfig.blockSizeV * 6.2,
                      onPressed: onPressed ?? Navigator.of(context).pop),
                  SizedBox(
                    width: ILSizeConfig.blockSizeH * 4,
                  ),
                  ILTextButton(
                      contentPadding: buttonTextPadding ??
                          EdgeInsets.symmetric(horizontal: 0),
                      backgroundColor:
                          secondButtonColor ?? ILColors.kPrimaryOrangeColor,
                      text: secondButtonText ?? "Ok",
                      textSize: 20,
                      width: buttonWidth ?? ILSizeConfig.blockSizeH * 30,
                      height: buttonHeight ?? ILSizeConfig.blockSizeV * 6,
                      onPressed: onPressed ?? Navigator.of(context).pop),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
