import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';

class ILExpansionTile extends StatefulWidget {
  final String title;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  late bool? isExpanded;
  final Widget? child;
  final bool? isCurved;
  final Color? titleColor;

  ILExpansionTile({
    required this.title,
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.isCurved,
    this.isExpanded,
    this.child,
    this.titleColor,
  });

  @override
  State<ILExpansionTile> createState() => _ILExpansionTileState();
}

class _ILExpansionTileState extends State<ILExpansionTile> {
  late double _width;
  late bool _isExpanded;
  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded = false;
    _width = widget.width ?? ILSizeConfig.screenWidth;
  }

  @override
  Widget build(BuildContext context) {
    _width = widget.width ?? ILSizeConfig.screenWidth;
    return PhysicalModel(
      borderRadius: BorderRadius.circular(widget.isCurved == true ? 10 : 2),
      shadowColor: Colors.grey,
      elevation: 1,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.isCurved == true ? 10 : 2),
          color: widget.backgroundColor ?? Colors.white,
        ),
        height: widget.height,
        width: _width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //top part
            PhysicalModel(
              borderRadius:
                  BorderRadius.circular(widget.isCurved == true ? 10 : 2),
              shadowColor: Colors.grey,
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
                    color: widget.backgroundColor ?? Colors.white,
                    borderRadius:
                        BorderRadius.circular(widget.isCurved == true ? 10 : 2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          widget.title,
                          style: ILTextStyles.kTitleRobotoMedium.copyWith(
                            fontSize: ILSizeConfig.textMultiplier * 4,
                            color: widget.titleColor ?? Colors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        child: Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up_sharp
                              : Icons.keyboard_arrow_down_sharp,
                          color: Colors.black45,
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
              Container(
                width: _width,
                child: widget.child,
              ),
          ],
        ),
      ),
    );
  }
}
