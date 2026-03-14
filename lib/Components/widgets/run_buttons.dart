import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';

Widget runButtons({
  required String number,
  required Color backgroundColor,
  required Color foregroundColor,
  required void Function(String) onPressed,
}) {
  return SizedBox(
    height: ButtonDesign.height,
    width: 90,
    child: Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(ButtonDesign.borderradius),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(ButtonDesign.borderradius),
        onTap: () => onPressed(number),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontSize: ButtonDesign.fontsize,
              fontWeight: ButtonDesign.fontweight,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    ),
  );
}
