# Cricket Match Scoring App — Product Requirements Document (PRD)

## 1. Product Overview

The Cricket Match Scoring App is a **lightweight offline mobile application** designed for casual cricket matches. It allows users to **record ball-by-ball scores quickly and accurately**, eliminating disputes caused by manual score tracking methods such as writing in sand or memory-based scoring.

The application is designed for **speed, simplicity, and fairness** during informal matches.

---

# 2. Product Goals

Primary goals of the application:

1. Enable **fast ball-by-ball scoring** during matches.
2. Ensure **accurate tracking of runs, extras, and wickets**.
3. Prevent disputes by introducing **over reconciliation and locking**.
4. Remove the need for **manual player name entry**.
5. Operate **fully offline** without authentication or storage.

---

# 3. Target Users

## Primary Users

### Match Scorer

The person responsible for entering ball results into the application during the match.

Responsibilities:

* Record runs
* Record extras
* Record wickets
* Confirm overs

---

### Players

Players rely on the application to:

* verify match score
* resolve disputes
* track match progress

---

### Bet Participants

In informal matches where stakes exist, the application provides **transparent scoring**.

---

# 4. Key Product Principles

The application must follow these principles:

1. **Single-tap scoring**
2. **Large buttons for outdoor use**
3. **No typing during the match**
4. **Minimal navigation**
5. **Clear visual feedback**

---

# 5. Functional Requirements

## 5.1 Match Setup

The user must be able to configure the match before starting.

Required settings:

| Setting          | Options            |
| ---------------- | ------------------ |
| Overs            | 6, 8, 10           |
| Players Per Team | 8, 9, 10, 11       |
| Team A           | IPL Team Selection |
| Team B           | IPL Team Selection |

Players will be automatically loaded from predefined squads.

Example teams include:

* Chennai Super Kings
* Mumbai Indians
* Royal Challengers Bangalore
* Kolkata Knight Riders
* Rajasthan Royals

---

## 5.2 Automatic Player Loading

To reduce setup time:

* Player names are automatically loaded from pre-defined squads.
* Only the required number of players is used.

Example:

| Selected Players | Used Players     |
| ---------------- | ---------------- |
| 8                | first 8 players  |
| 9                | first 9 players  |
| 10               | first 10 players |

---

# 6. Match Rules Logic

## Wicket Limit

The number of wickets depends on players available.

Formula:

```
max_wickets = players - 1
```

Example:

| Players | Max Wickets |
| ------- | ----------- |
| 8       | 7           |
| 9       | 8           |
| 10      | 9           |
| 11      | 10          |

---

## Match End Conditions

The match ends when any of the following occurs:

1. Overs are completed.
2. Maximum wickets are reached.
3. Target score is achieved (second innings).

---

# 7. Scoring System

The application must support recording the following events.

## Runs

| Action | Score Change |
| ------ | ------------ |
| 0      | 0 runs       |
| 1      | +1           |
| 2      | +2           |
| 3      | +3           |
| 4      | +4           |
| 6      | +6           |

---

## Extras

| Extra Type | Score | Ball Count  |
| ---------- | ----- | ----------- |
| Wide       | +1    | Not counted |
| No Ball    | +1    | Not counted |
| Bye        | +runs | Counted     |
| Leg Bye    | +runs | Counted     |

---

## Wickets

When a wicket occurs:

* Wickets increase by 1
* Ball is counted
* New batsman enters automatically

---

# 8. Over Management

An over consists of **6 valid balls**.

After 6 balls:

1. An **Over Summary screen** must appear.
2. The scorer must confirm the over.
3. Once confirmed, the over becomes **locked**.

Locked overs cannot be edited.

---

# 9. Undo Behavior

The system must support **Undo Last Ball**.

Rules:

* Only the **most recent ball** can be undone.
* Locked overs cannot be modified.

---

# 10. Ball Timeline

Each over should display a **ball history indicator**.

Example:

```
1 0 4 W 2 1
```

Where:

| Symbol | Meaning  |
| ------ | -------- |
| 0      | Dot ball |
| 1-6    | Runs     |
| W      | Wicket   |
| Wd     | Wide     |
| Nb     | No ball  |

---

# 11. Innings Flow

The match consists of **two innings**.

## First Innings

Team A bats.

When innings ends:

```
Target = Score + 1
```

---

## Second Innings

Team B chases the target.

The match ends when:

* target reached
* overs completed
* wickets exhausted

---

# 12. Non-Functional Requirements

## Offline Operation

The application must:

* function without internet
* store data only in memory
* not use external APIs

---

## Non-Persistence

The application should **not store match data**.

When the app closes:

* match data is lost
* a new match must start

---

## Performance

The application must provide:

| Metric          | Requirement |
| --------------- | ----------- |
| App launch      | < 1 second  |
| Button response | < 50 ms     |
| UI transitions  | < 100 ms    |

---

# 13. Security and Privacy

Since the application:

* has no login
* stores no data
* uses no network

Security risks are minimal.

---

# 14. Error Handling

The application must handle the following scenarios gracefully:

| Scenario        | Behavior                  |
| --------------- | ------------------------- |
| Accidental tap  | Allow Undo                |
| Over miscount   | Over summary confirmation |
| Wrong run entry | Undo before next ball     |

---

# 15. Testing Requirements

Before release, the following scenarios must be tested.

### Scoring Tests

* Dot ball
* Single
* Boundary
* Six

---

### Extras Tests

* Wide ball
* No ball
* Bye
* Leg bye

---

### Match Logic Tests

* Wicket replacement
* Over completion
* Target chase
* Match result

---

# 16. Deployment

The application will be distributed as an **Android APK**.

Distribution method:

* Direct sharing via messaging apps
* Manual installation

---

# 17. Future Enhancements (Version 2)

Possible improvements:

* Player statistics
* Run rate calculation
* Scoreboard screen
* Shot visualization
* Voice scoring input

---

# 18. Release Timeline

| Day   | Task                              |
| ----- | --------------------------------- |
| Day 1 | UI screens and match setup        |
| Day 2 | Scoring logic and innings system  |
| Day 3 | Over locking, testing, bug fixing |

---

# 19. Success Criteria

The product will be considered successful if:

1. Users can score a ball in **under 2 seconds**.
2. No disputes occur due to missing scores.
3. The application runs smoothly during an entire match.
