import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';

Widget timelineSingle({
  required String number,
  required Color backgroundColor,
}) {
  return SizedBox(
    height: 50,
    width: 50,
    child: Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
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
  );
}
