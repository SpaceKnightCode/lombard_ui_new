import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ILHeadingTextBox extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? urlText;
  final String? url;

  final double? titleSize;
  final double? subtitleSize;
  final double? urlSize;

  final Color? titleColor;
  final Color? subtitleColor;
  final Color? urlColor;

  const ILHeadingTextBox(
      {super.key,
      required this.title,
      this.url,
      this.titleSize,
      this.titleColor,
      this.urlColor,
      this.subtitle,
      this.subtitleSize,
      this.subtitleColor,
      this.urlText,
      this.urlSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: ILTextStyles.kTitleRobotoBold.copyWith(
                color: titleColor ?? ILColors.kdarkBlueColor,
                fontSize: titleSize ?? ILSizeConfig.textMultiplier * 7,
                fontWeight: FontWeight.w500,
              ),
            ),
            url != null
                ? GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse(url!));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        urlText ?? "View Details",
                        style: ILTextStyles.kTitleRobotoBold.copyWith(
                          decoration: TextDecoration.underline,
                          color: urlColor ?? ILColors.kdarkBlueColor,
                          fontSize:
                              urlSize ?? ILSizeConfig.textMultiplier * 3.5,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        subtitle != null
            ? Container(
                child: Text(
                  subtitle!,
                  style: ILTextStyles.kTitleRobotoBold.copyWith(
                    color: urlColor ?? ILColors.kdarkBlueColor,
                    fontSize: urlSize ?? ILSizeConfig.textMultiplier * 4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
