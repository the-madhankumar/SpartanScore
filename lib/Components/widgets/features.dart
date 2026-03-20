import 'package:flutter/material.dart';
import 'package:spartan_score/Components/theme/colors.dart';

void showFeaturesDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.selectedRun,
        title: Text(
          'Cricket Scoring App — Features',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        content: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle('Match Setup'),
                _feature('Configure total overs'),
                _feature('Set number of players per team'),
                _feature('Select Team A & Team B (IPL teams)'),
                _feature('Prevents selecting the same team'),

                _sectionTitle('Automatic Player Management'),
                _feature('Players auto-loaded from predefined squads'),
                _feature('Opening batsmen assigned automatically'),
                _feature('New batsman comes in after wicket'),
                _feature('No manual typing needed'),

                _sectionTitle('Live Ball-by-Ball Scoring'),
                _feature('Add runs (0–6) instantly'),
                _feature('Record wickets'),
                _feature('Track score in real-time'),
                _feature('Automatic strike rotation (odd runs)'),

                _sectionTitle('Extras Handling'),
                _feature('Wide ball (+1, no ball count)'),
                _feature('No ball (+runs +1, free hit style)'),
                _feature('Custom extras like 2G supported'),

                _sectionTitle('Over Management'),
                _feature('Tracks balls per over (6 balls logic)'),
                _feature('Automatically marks over completion'),
                _feature('Stores over history'),
                _feature('Strike rotates after over'),

                _sectionTitle('Score Tracking'),
                _feature('Team-wise score & wickets'),
                _feature('Individual batsman stats'),
                _subFeature('Runs'),
                _subFeature('Balls faced'),
                _feature('Live score updates'),

                _sectionTitle('Innings System'),
                _feature('Two innings supported'),
                _feature('Target auto-calculated'),
                _feature('Seamless switch to second innings'),

                _sectionTitle('Match Result Logic'),
                _feature('Match ends when:'),
                _subFeature('Overs completed'),
                _subFeature('All wickets lost'),
                _subFeature('Target achieved'),
                _feature('Automatically detects winner'),

                _sectionTitle('Ball Timeline'),
                _feature('Stores every ball event'),
                _feature('Tracks runs, extras, wickets'),
                _feature('Maintains over-wise history'),

                _sectionTitle('Undo Feature (In Progress)'),
                _feature('Undo last ball action'),
                _feature('Score rollback logic implemented'),
                _feature('UI/edge cases still under development'),

                _sectionTitle('Reset Match'),
                _feature('Reset entire match instantly'),
                _feature('Clears scores, players, and history'),

                _sectionTitle('Smart Error Handling'),
                _feature('Prevents same team selection'),
                _feature('Blocks actions after match end'),
                _feature('Prevents scoring after over completion'),

                _sectionTitle('Offline First'),
                _feature('No internet required'),
                _feature('No login/signup'),
                _feature('Fast and lightweight'),

                _sectionTitle('Performance Focused'),
                _feature('Instant button response'),
                _feature('Minimal UI lag'),
                _feature('Designed for real-time usage'),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: AppColors.textPrimary,
      ),
    ),
  );
}

Widget _feature(String feature) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
    child: Text('• $feature', style: TextStyle(color: AppColors.textPrimary)),
  );
}

Widget _subFeature(String feature) {
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, bottom: 2.0),
    child: Text('- $feature', style: TextStyle(color: AppColors.textPrimary)),
  );
}
