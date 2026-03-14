# 1. App Architecture (Simple)

Since you want **no storage and no authentication**, keep everything in **memory state**.

Structure:

```
lib/
 ├ main.dart
 ├ models/
 │   ├ match.dart
 │   ├ innings.dart
 │   └ ball.dart
 │
 ├ screens/
 │   ├ home_screen.dart
 │   ├ match_setup_screen.dart
 │   ├ scoring_screen.dart
 │   ├ over_summary_screen.dart
 │   └ result_screen.dart
 │
 ├ widgets/
 │   ├ score_card.dart
 │   ├ run_buttons.dart
 │   ├ extras_buttons.dart
 │   ├ wicket_button.dart
 │   └ ball_timeline.dart
```

State management can simply be:

```
setState()
```

No need for Provider/Bloc for a 3-day project.

---

# 2. Core Data Models

## Ball Model

```dart
class Ball {
  int runs;
  String extra; // wide, noball, bye, legbye
  bool wicket;

  Ball({
    this.runs = 0,
    this.extra = "",
    this.wicket = false,
  });
}
```

---

## Over Model

```dart
class Over {
  List<Ball> balls = [];
  bool locked = false;
}
```

---

## Innings Model

```dart
class Innings {
  int score = 0;
  int wickets = 0;
  int overs = 0;
  int balls = 0;

  List<Over> overList = [];
}
```

---

# 3. UI Screens

You only need **5 screens**.

---

# 4. Screen 1 — Home Screen

Purpose: **Start match immediately**

UI Layout:

```
CRICKET SCORE APP

[ Start Match ]
```

Flutter widget idea:

```dart
ElevatedButton(
  child: Text("Start Match"),
  onPressed: () {
    Navigator.push(...);
  },
)
```

Keep it **clean and simple**.

---

# 5. Screen 2 — Match Setup

Goal: setup in **<10 seconds**

UI:

```
Match Setup

Overs
[6] [8] [10]

Players Per Team
[8] [9] [10] [11]

Team A
Dropdown (IPL Teams)

Team B
Dropdown (IPL Teams)

[ Start Match ]
```

Preload squads for teams like:

* Chennai Super Kings
* Mumbai Indians
* Royal Challengers Bangalore
* Kolkata Knight Riders
* Rajasthan Royals

When players selected = 9 → only first **9 players loaded**.

---

# 6. Screen 3 — Scoring Screen (Main Screen)

This is **90% of the app**.

Layout:

```
---------------------------------
TEAM A

Score: 54 / 3
Overs: 5.2

Striker: Dhoni
Non Striker: Jadeja
---------------------------------

Ball History
1 0 4 W 2 1

---------------------------------

RUNS
[0] [1] [2] [3]
[4] [6]

EXTRAS
[Wide] [No Ball]
[Bye] [Leg Bye]

[ WICKET ]

[ Undo ]

---------------------------------
```

---

# 7. Flutter Widget Layout

Example structure:

```
Column
 ├ ScoreCard()
 ├ BallTimeline()
 ├ RunButtons()
 ├ ExtrasButtons()
 ├ WicketButton()
 └ UndoButton()
```

---

# 8. Run Buttons UI

```dart
GridView.count(
 crossAxisCount: 3,
 children: [
  runButton(0),
  runButton(1),
  runButton(2),
  runButton(3),
  runButton(4),
  runButton(6),
 ],
)
```

---

# 9. Extras Buttons

```
Wide
No Ball
Bye
Leg Bye
```

Each updates score differently.

Example:

Wide:

```
score + 1
ball NOT counted
```

Bye:

```
score + runs
ball counted
```

---

# 10. Wicket Button

```
score unchanged
wickets + 1
ball counted
new batsman auto loaded
```

---

# 11. Auto Player Rotation

Logic:

```
odd run → swap striker
even run → same striker
```

End of over:

```
swap striker
```

---

# 12. Ball Timeline Widget

Example:

```
1 0 4 W 2 1
```

Flutter UI:

```
Wrap(
 children: ballList.map((b) => Chip(label: Text("4"))).toList()
)
```

---

# 13. Over Reconciliation Screen

After 6 balls show:

```
Over 5 Summary

1
0
4
W
2
1

Runs: 8
Wickets: 1

[ Confirm Over ]
[ Edit ]
```

When confirmed:

```
OVER LOCKED
```

Locked overs **cannot be edited**.

This solves match disputes.

---

# 14. Second Innings Screen

After first innings:

```
Target: 75

Team B needs 76 runs
```

Then continue same scoring screen.

---

# 15. Match Result Screen

Example:

```
TEAM B WON

Score
76 / 3

Overs
5.4
```

Button:

```
[ New Match ]
```

---

# 16. UI Color Design

Keep colors intuitive.

| Action | Color  |
| ------ | ------ |
| Runs   | Blue   |
| Extras | Orange |
| Wicket | Red    |
| Undo   | Grey   |

Example Flutter:

```
color: Colors.blue
```

---

# 17. Button Size Requirement

Because scoring happens outdoors.

Minimum size:

```
height: 70
fontSize: 24
```

---

# 18. Important UX Rules

1️⃣ **Single tap scoring**

Never require multiple taps.

---

2️⃣ **Undo only last ball**

Prevents cheating.

---

3️⃣ **Over locking**

After confirmation.

---

4️⃣ **Automatic batsman loading**

No typing.

---

# 19. Performance Requirements

Since this is offline:

App should:

* start < **1 second**
* scoring response < **50ms**
* no internet calls

---

# 20. Testing Checklist

Before release test:

✔ Wide ball scoring
✔ No ball scoring
✔ Over change
✔ Wicket replacement
✔ Target chase end
✔ Undo feature
✔ Over locking

---

# 21. Optional Cool Features (If Time)

### Sound

4 → boundary sound
6 → crowd cheer

---

### Vibrate on Wicket

```
HapticFeedback.mediumImpact();
```

---

### Quick Reset

Long press:

```
Reset Match
```

---

# 22. Release Method

Simplest:

```
flutter build apk
```

Share APK in WhatsApp.

Done.

---

# 23. Real Advice (Important)

Do **NOT add too many features now**.

Version 1 must be:

✔ Fast
✔ Accurate
✔ Simple

If your friends actually start using it every Sunday, **then expand it**.
