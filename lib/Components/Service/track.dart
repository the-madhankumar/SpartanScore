// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:spartan_score/Components/Data/teams.dart';
import 'package:spartan_score/Components/models/ball.dart';
import 'package:spartan_score/Components/models/match.dart';
import 'package:spartan_score/Components/theme/colors.dart';

class Track extends ChangeNotifier {
  int? totalOvers;
  int? totalTeamSize;

  String teamA = "";
  int teamAScore = 0;
  int teamAWickets = 0;

  String teamB = "";
  int teamBScore = 0;
  int teamBWickets = 0;

  bool teamToggle = true;

  int score = 0;
  int wickets = 0;

  int strikerScore = 0;
  int strikerTimeline = 0;

  int nonstrikerScore = 0;
  int nonStrikerTimeline = 0;

  bool togglePlayers = true;

  Map<String, Team> get teamsMap => {
    "Chennai Super Kings": TeamCode.CSK,
    "Mumbai Indians": TeamCode.MI,
    "Gujarat Titans": TeamCode.GT,
    "Royal Challengers Bengaluru": TeamCode.RCB,
    "Kolkata Knight Riders": TeamCode.KKR,
    "Delhi Capitals": TeamCode.DC,
    "Rajasthan Royals": TeamCode.RR,
    "Sunrisers Hyderabad": TeamCode.SRH,
    "Punjab Kings": TeamCode.PBKS,
    "Lucknow Super Giants": TeamCode.LSG,
  };

  Team get teamAInfo => teamsMap[teamA] ?? TeamCode.CSK;
  Team get teamBInfo => teamsMap[teamB] ?? TeamCode.MI;

  List<String> _teamAPlayers = [];
  List<String> _teamBPlayers = [];

  List<String> get teamAPlayers => _teamAPlayers;
  List<String> get teamBPlayers => _teamBPlayers;

  int strikerIndex = 0;
  int nonStrikerIndex = 1;
  int nextBatsmanIndex = 2;

  int timeLineLength = 0;
  List<Ball> timeline = [];
  List<Over> history = [];
  List<Player> scorecard = [];

  bool overCompleted = false;

  bool matchCompleted = false;

  void setOvers(String value) {
    totalOvers = int.tryParse(value);
    notifyListeners();
  }

  void setTeamSize(String value) {
    totalTeamSize = int.tryParse(value);
    notifyListeners();
  }

  void setTeamA(String value, BuildContext context) {
    if (value == teamB) {
      showError("Both teams cannot be the same", context);
      return;
    }
    teamA = value;
    _teamAPlayers = List.from(teamsMap[teamA]!.players);
    strikerIndex = 0;
    nonStrikerIndex = 1;
    nextBatsmanIndex = 2;
    notifyListeners();
  }

  void setTeamB(String value, BuildContext context) {
    if (value == teamA) {
      showError("Both teams cannot be the same", context);
      return;
    }
    teamB = value;
    _teamBPlayers = List.from(teamsMap[teamB]!.players);
    notifyListeners();
  }

  void showError(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.background,
        content: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  void setOpeningPlayers({required List<String> players}) {
    if (matchCompleted) return;
    if (teamToggle) {
      _teamAPlayers = List.from(players);
    } else {
      _teamBPlayers = List.from(players);
    }
    strikerIndex = 0;
    nonStrikerIndex = 1;
    nextBatsmanIndex = 2;
    strikerScore = 0;
    nonstrikerScore = 0;
    strikerTimeline = 0;
    nonStrikerTimeline = 0;
    togglePlayers = true;
    notifyListeners();
  }

  void addScore(String val) {
    if (overCompleted || matchCompleted) return;
    int run = int.tryParse(val) ?? 0;
    score += run;
    timeline.add(Ball(runs: run));
    timeLineLength++;
    if (timeLineLength >= 6) overCompleted = true;

    if (teamToggle) {
      teamAScore = score;
    } else {
      teamBScore = score;

      if (teamBScore > teamAScore) {
        matchCompleted = true;
        notifyListeners();
        return;
      }
    }

    if (togglePlayers) {
      strikerScore += run;
      strikerTimeline++;
    } else {
      nonstrikerScore += run;
      nonStrikerTimeline++;
    }

    if (run % 2 == 1) swapPlayers();

    notifyListeners();

    checkInningsEnd();
  }

  void wicket() {
    if (overCompleted || matchCompleted) return;

    wickets++;
    timeline.add(Ball(wicket: true, runs: 0));
    timeLineLength++;

    if (timeLineLength >= 6) overCompleted = true;

    if (teamToggle) {
      teamAWickets = wickets;
    } else {
      teamBWickets = wickets;
    }

    final players = teamToggle ? _teamAPlayers : _teamBPlayers;

    if (nextBatsmanIndex < players.length) {
      if (togglePlayers) {
        scorecard.add(
          Player(
            playerName: currentStriker,
            runsScored: strikerScore,
            ballsFaced: strikerTimeline,
          ),
        );

        strikerIndex = nextBatsmanIndex;
        strikerScore = 0;
        strikerTimeline = 0;
      } else {
        scorecard.add(
          Player(
            playerName: currentNonStriker,
            runsScored: nonstrikerScore,
            ballsFaced: nonStrikerTimeline,
          ),
        );

        nonStrikerIndex = nextBatsmanIndex;
        nonstrikerScore = 0;
        nonStrikerTimeline = 0;
      }

      nextBatsmanIndex++;
    }

    notifyListeners();
    checkInningsEnd();
  }

  void wide() {
    if (matchCompleted) return;
    score += 1;
    timeline.add(Ball(extra: "WD", runs: 1));
    notifyListeners();
  }

  void twoG() {
    if (overCompleted || matchCompleted) return;
    score += 2;
    timeline.add(Ball(extra: "2G", runs: 2));
    timeLineLength++;
    if (timeLineLength >= 6) overCompleted = true;
    notifyListeners();
  }

  void noBall() {
    if (matchCompleted) return;
    score += 1;
    timeline.add(Ball(extra: "NB", runs: 1));
    notifyListeners();
  }

  void nextOver() {
    if (matchCompleted) return;
    history.add(Over()..balls = List.from(timeline));
    timeline.clear();
    timeLineLength = 0;
    overCompleted = false;
    swapPlayers();
    notifyListeners();
  }

  void swapPlayers() {
    if (matchCompleted) return;
    togglePlayers = !togglePlayers;
    notifyListeners();
  }

  void checkInningsEnd() {
    if (matchCompleted) return;

    final maxOversReached =
        totalOvers != null &&
        (history.length + (timeLineLength / 6)) >= totalOvers!;

    final allOut = totalTeamSize != null && wickets >= totalTeamSize! - 1;

    if (maxOversReached || allOut) {
      if (teamToggle) {
        teamToggle = false;
        scorecard.clear();

        score = 0;
        wickets = 0;
        strikerScore = 0;
        nonstrikerScore = 0;
        strikerTimeline = 0;
        nonStrikerTimeline = 0;

        timeline.clear();
        timeLineLength = 0;
        overCompleted = false;

        strikerIndex = 0;
        nonStrikerIndex = 1;
        nextBatsmanIndex = 2;

        _teamBPlayers = List.from(teamsMap[teamB]!.players);
      } else {
        matchCompleted = true;
      }

      notifyListeners();
    }
  }

  void resetMatch() {
    score = 0;
    wickets = 0;
    timeline.clear();
    history.clear();
    timeLineLength = 0;
    overCompleted = false;
    totalOvers = null;
    totalTeamSize = null;
    teamA = "";
    teamB = "";
    _teamAPlayers.clear();
    _teamBPlayers.clear();
    strikerIndex = 0;
    nonStrikerIndex = 1;
    nextBatsmanIndex = 2;
    matchCompleted = false;
    teamAScore = 0;
    teamBScore = 0;
    teamAWickets = 0;
    teamBWickets = 0;
    scorecard.clear();
    notifyListeners();
  }

  String get currentStriker {
    final players = teamToggle ? _teamAPlayers : _teamBPlayers;
    if (strikerIndex < 0 || strikerIndex >= players.length) return "";
    return players[strikerIndex];
  }

  String get currentNonStriker {
    final players = teamToggle ? _teamAPlayers : _teamBPlayers;
    if (nonStrikerIndex < 0 || nonStrikerIndex >= players.length) return "";
    return players[nonStrikerIndex];
  }
}
