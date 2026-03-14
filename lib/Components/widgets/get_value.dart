
import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';
import 'package:spartan_score/Components/widgets/run_buttons.dart';

Widget getValueWidget({
  required List<String> vals,
  required void Function(String) onPressed,
  required int? selectedValue,
}) {
  return Wrap(
    spacing: 18,
    runSpacing: 18,
    alignment: WrapAlignment.center,
    children: [
      for (var num in vals)
        runButtons(
          number: num,
          backgroundColor: selectedValue == int.parse(num)
              ? AppColors.selectedRun
              : AppColors.run,
          foregroundColor: selectedValue == int.parse(num)
              ? AppColors.textSecondary
              : AppColors.textPrimary,
          onPressed: onPressed,
        ),
    ],
  );
}
