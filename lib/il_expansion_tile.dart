import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';

// ignore: must_be_immutable
class ILExpansionTile extends StatefulWidget {
  final String title;
  // final double? height;
  final double? width;
  final Color? backgroundColor;
  late bool? isExpanded;
  final Widget? child;
  final bool? isCurved;
  final Color? titleColor;
  ILExpansionTile({
    required this.title,
    super.key,
    // this.height,
    this.width,
    this.backgroundColor,
    this.isCurved = true,
    this.isExpanded,
    this.child,
    this.titleColor,
  });

  @override
  State<ILExpansionTile> createState() => _ILExpansionTileState();
}

class _ILExpansionTileState extends State<ILExpansionTile> {
  late double _width;
  bool _isExpanded = false;
  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded = false;
    _width = widget.width ?? ILSizeConfig.screenWidth;
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(widget.isCurved == true ? 10 : 2),
      shadowColor: ILColors.kGreyColor585858,
      elevation: 1,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.isCurved == true ? 10 : 2),
          color: widget.backgroundColor ?? ILColors.kWhiteColor,
        ),
        // height: widget.height,
        width: _width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //top part
            PhysicalModel(
              borderRadius:
                  BorderRadius.circular(widget.isCurved == true ? 10 : 2),
              shadowColor: ILColors.kGreyColor585858,
              color: Colors.transparent,
              elevation: 0.6,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ILSizeConfig.blockSizeH * 4,
                      vertical: ILSizeConfig.blockSizeV * 2),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor ?? ILColors.kWhiteColor,
                    borderRadius:
                        BorderRadius.circular(widget.isCurved == true ? 10 : 2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: Text(
                          widget.title,
                          style: ILTextStyles.kTitleRobotoMedium.copyWith(
                            fontSize: ILSizeConfig.textMultiplier * 4,
                            color: widget.titleColor ?? ILColors.kBlackColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        child: Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up_sharp
                              : Icons.keyboard_arrow_down_sharp,
                          color: ILColors.kBlackColor.withOpacity(0.5),
                          size: ILSizeConfig.heightMultiplier * 4.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //bottom part - expanded
            if (_isExpanded)
              SizedBox(
                width: _width,
                child: widget.child,
              ),
          ],
        ),
      ),
    );
  }
}
