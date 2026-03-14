import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';

Widget timelineSingle({
  required String number,
  required Color backgroundColor,
}) {
  return SizedBox(
    height: 50,
    width: 50,
    child: Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(50),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {},
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
