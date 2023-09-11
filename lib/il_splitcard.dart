import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';

class ILSplitCard extends StatelessWidget {
  const ILSplitCard(
      {super.key,
      required this.width,
      this.height,
      this.header,
      required this.body,
      this.footer,
      this.cardColor});
  final double width;
  final double? height;
  final Widget? header;
  final Widget body;
  final Widget? footer;
  final Color? cardColor;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 2,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: cardColor ?? ILColors.kWhiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
            vertical: ILSizeConfig.blockSizeV * 3,
            horizontal: ILSizeConfig.blockSizeH * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            (header != null)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(child: header),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: ILSizeConfig.blockSizeV * 3,
                        ),
                        height: ILSizeConfig.blockSizeV * 0.1,
                        color: ILColors.kGreyColorc3c3c3,
                      ),
                    ],
                  )
                : Container(),
            body,
            (footer != null)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: ILSizeConfig.blockSizeV * 3,
                        ),
                        height: ILSizeConfig.blockSizeV * 0.1,
                        color: ILColors.kGreyColorc3c3c3,
                      ),
                      Container(child: footer),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
