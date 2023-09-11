import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';

class ILDetailsCard extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Color? textColor;
  final Widget? child;

  ILDetailsCard({
    super.key,
    required this.title,
    this.iconData,
    this.foregroundColor,
    this.backgroundColor,
    this.width,
    this.height,
    this.textColor,
    this.child,
  });

  final double _borderRadius = 10;
  @override
  Widget build(BuildContext context) {
    final _width = width ?? ILSizeConfig.screenWidth;

    return PhysicalModel(
      elevation: 1,
      borderRadius: BorderRadius.circular(_borderRadius),
      color: ILColors.kBlackColor,
      child: Container(
        width: _width,
        decoration: BoxDecoration(
          color: ILColors.kWhiteColor,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            PhysicalModel(
              elevation: 2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_borderRadius),
                topRight: Radius.circular(_borderRadius),
              ),
              color: ILColors.kBlackColor,
              shadowColor: ILColors.kGreyColor585858,
              child: Container(
                width: _width,
                decoration: BoxDecoration(
                  color: ILColors.kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_borderRadius),
                    topRight: Radius.circular(_borderRadius),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: ILSizeConfig.blockSizeV * 1.8,
                    horizontal: ILSizeConfig.blockSizeH * 4,
                  ),
                  child: Text(
                    title,
                    style: ILTextStyles.kTitleRobotoRegular.copyWith(
                      color: textColor ?? ILColors.kPrimaryBlueColor,
                      fontSize: ILSizeConfig.textMultiplier * 6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: ILSizeConfig.blockSizeV * 4,
                horizontal: ILSizeConfig.blockSizeH * 4,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
