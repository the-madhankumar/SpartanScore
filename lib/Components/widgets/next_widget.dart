// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';

Widget nextWidget(String value, {void Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: SizedBox(
      height: ButtonDesign.height,
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onPressed,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.undo, width: 2),
              gradient: LinearGradient(
                colors: [
                  AppColors.undo.withOpacity(0.9),
                  AppColors.undo.withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.next_plan, color: Colors.white, size: 20),
                  SizedBox(width: 6),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
