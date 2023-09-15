import 'package:flutter/material.dart';
import 'package:lombard_ui/common/il_constants.dart';

class ILDropdown extends StatefulWidget {
  final List<String> items;
  final double? width;
  final double? height;
  final String? label;
  final void Function(String) onChanged;
  final int? defaultValueIndex;
  final IconData? icon;
  final double? textSize;
  final double? labelSize;
  final double? iconSize;
  final Color? textItemsColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? fillColor;
  final Color? labelColor;
  final Color? floatingLabelColor;
  final Color? focusedBorderColor;
  final Color? menuColor;
  final bool isExpanded;
  final bool isDisabled;
  final bool isCurved;
  final Alignment? alignment;

  const ILDropdown({
    required this.items,
    this.defaultValueIndex,
    required this.onChanged,
    this.isExpanded = false,
    this.alignment,
    this.width,
    this.height,
    this.icon,
    this.textSize,
    this.iconSize,
    this.textItemsColor,
    this.borderColor,
    this.fillColor,
    this.label,
    this.focusedBorderColor,
    this.labelColor,
    this.floatingLabelColor,
    this.isDisabled = false,
    this.labelSize,
    this.isCurved = true,
    this.iconColor,
    this.menuColor,
  });

  @override
  State<ILDropdown> createState() => _ILDropdownState();
}

class _ILDropdownState extends State<ILDropdown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width ?? ILSizeConfig.blockSizeH * 85,
      child: DropdownButtonFormField(
        borderRadius: BorderRadius.circular(widget.isCurved ? 10 : 0),
        isDense: true,
        dropdownColor: widget.menuColor ?? ILColors.kWhiteColor,
        icon: Icon(widget.icon ?? Icons.keyboard_arrow_down),
        iconSize: widget.iconSize ?? ILSizeConfig.blockSizeH * 10,
        iconEnabledColor: widget.iconColor ?? ILColors.kGreyBorderPrimaryColor,
        iconDisabledColor: ILColors.kGreyColorc3c3c3,
        isExpanded: widget.isExpanded,
        menuMaxHeight: ILSizeConfig.blockSizeV * 40,
        style: ILTextStyles.kTitleRobotoRegular.copyWith(
          fontSize: widget.textSize ?? ILSizeConfig.textMultiplier * 4.5,
          color: widget.textItemsColor ?? ILColors.kBlackColor,
        ),
        value: widget.defaultValueIndex != null
            ? widget.items[widget.defaultValueIndex!]
            : null,
        decoration: InputDecoration(
          enabled: !widget.isDisabled,
          floatingLabelStyle: TextStyle(
              color: widget.floatingLabelColor ??
                  ILColors.kGreyBorderPrimaryColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.isCurved ? 10 : 0),
            borderSide: BorderSide(
              color: widget.borderColor ?? ILColors.kGreyBorderPrimaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.isCurved ? 10 : 0),
            borderSide: BorderSide(
              color:
                  widget.focusedBorderColor ?? ILColors.kGreyBorderPrimaryColor,
            ),
          ),
          constraints: BoxConstraints.loose(Size.infinite),
          labelText: widget.label ?? "",
          labelStyle: TextStyle(
            fontSize: widget.labelSize ??
                widget.textSize ??
                ILSizeConfig.textMultiplier * 4.5,
            color: widget.isDisabled
                ? ILColors.kGreyColorc3c3c3
                : widget.labelColor ?? ILColors.kGreyColor585858,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.isCurved ? 10 : 0),
            borderSide: const BorderSide(color: ILColors.kGreyColor),
          ),
          filled: widget.isDisabled
              ? true
              : widget.fillColor != null
                  ? true
                  : false,
          fillColor: widget.isDisabled
              ? ILColors.kGreyColor
              : widget.fillColor ?? Colors.transparent,
        ),
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: widget.isDisabled
            ? null
            : (value) {
                setState(() {
                  widget.onChanged(value.toString());
                });
              },
      ),
    );
  }
}
