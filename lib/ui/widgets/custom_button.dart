import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final bool isSelected;
  final Function() onPressed;
  final EdgeInsets margin;
  const CustomButton({
    Key? key,
    required this.title,
    this.isSelected = false,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? kUnvailableColor : kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: isSelected
              ? greyTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                )
              : whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
        ),
      ),
    );
  }
}
