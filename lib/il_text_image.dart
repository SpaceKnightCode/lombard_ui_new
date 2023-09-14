import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_colors.dart';

enum TextAlign { start, centre, end }

enum Position { top, bottom }

class ILTextImage extends StatelessWidget {
  final Image image;
  final String text;

  final double? textSize;
  final double? height;
  final double? width;

  final Position? textPosition;

  final Color? textColor;
  final Color? imageColor;
  final Color? borderColor;
  final Color? backgroundColor;

  final double? spacing;
  final TextAlign? textAlign;
  final BoxFit? fit;
  final double? padding;

  final bool? isCurved;

  const ILTextImage(
      {super.key,
      required this.image,
      required this.text,
      this.textSize,
      this.height,
      this.width,
      this.textAlign,
      this.textColor,
      this.imageColor,
      this.spacing,
      this.textPosition,
      this.isCurved = false,
      this.fit,
      this.padding,
      this.borderColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
        color: backgroundColor ?? ILColors.kWhiteColor,
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(isCurved! ? 10 : 0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          textPosition == Position.top
              ? Row(
                  mainAxisAlignment: textAlign == TextAlign.start
                      ? MainAxisAlignment.start
                      : textAlign == TextAlign.end
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          ClipRRect(
            borderRadius: BorderRadius.circular(isCurved! ? 10 : 0),
            child: Image(
              color: imageColor ?? Colors.transparent,
              width: width,
              height: height,
              colorBlendMode: BlendMode.color,
              fit: fit ?? BoxFit.fill,
              image: image.image,
            ),
          ),
          SizedBox(
            height: spacing,
          ),
          textPosition == Position.bottom || textPosition == null
              ? Row(
                  mainAxisAlignment: textAlign == TextAlign.start
                      ? MainAxisAlignment.start
                      : textAlign == TextAlign.end
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
