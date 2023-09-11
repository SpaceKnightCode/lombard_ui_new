import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ILOptionsTextbox extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;

  final String text;
  final bool? hasInfo;
  final String? infoUrl;
  final bool? isDisabled;
  final IconData? infoIcon;
  final double? textSize;
  final Color? textColor;
  final Color? infoIconColor;
  final Color? iconColor;
  final VoidCallback? onTapInfo;
  const ILOptionsTextbox({
    super.key,
    this.leading,
    this.trailing,
    required this.text,
    this.hasInfo = false,
    this.infoUrl,
    this.isDisabled = false,
    this.infoIcon = Icons.info_outline,
    this.textSize,
    this.textColor,
    this.infoIconColor,
    this.iconColor,
    this.onTapInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: ILSizeConfig.blockSizeH * 5,
                height: ILSizeConfig.blockSizeV * 3,
                child: leading!,
              ),
              SizedBox(
                width: ILSizeConfig.blockSizeH * 1.5,
              ),
            ],
          ),
        Text(text,
            style: ILTextStyles.kTitleRobotoRegular.copyWith(
              fontSize: textSize ?? ILSizeConfig.textMultiplier! * 4.5,
              color: isDisabled ?? false
                  ? ILColors.kGreyColor585858
                  : textColor ?? ILColors.kBlackColor,
            )),
        if (trailing != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: ILSizeConfig.blockSizeH * 1.5,
              ),
              Container(
                width: ILSizeConfig.blockSizeH * 5,
                height: ILSizeConfig.blockSizeV * 3,
                child: trailing!,
              ),
            ],
          ),
        hasInfo ?? false
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: onTapInfo ??
                        () async {
                          if (infoUrl != null) {
                            await launchUrl(Uri.parse(infoUrl!));
                          }
                        },
                    child: Icon(
                      infoIcon,
                      size: ILSizeConfig.imageSizeMultiplier * 2.5,
                      color: infoIconColor ?? ILColors.kGreyColor454545,
                    ),
                  ),
                  Container(
                    height: ILSizeConfig.blockSizeV,
                  )
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
