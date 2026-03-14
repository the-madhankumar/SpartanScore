// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';

Widget extraButton({
  required String label,
  required void Function() onPressed,
}) {
  return SizedBox(
    height: ButtonDesign.height,
    width: 100,
    child: Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(ButtonDesign.borderradius),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(ButtonDesign.borderradius),
        onTap: () => onPressed(),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ButtonDesign.borderradius),
            gradient: LinearGradient(
              colors: [AppColors.extra, AppColors.extra.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle_outline, size: 18, color: Colors.white),
                SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: ButtonDesign.fontsize - 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
