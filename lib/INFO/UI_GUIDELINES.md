# Cricket Scoring App — UI Design Guidelines

## 1. Design Goals

The UI must be optimized for **fast scoring during outdoor cricket matches**.

Primary principles:

* **One tap scoring**
* **Large touch targets**
* **Clear color meaning**
* **Minimal visual clutter**
* **High contrast for sunlight visibility**

---

# 2. Color Palette

## Base Colors

| Purpose         | Color     | Hex       |
| --------------- | --------- | --------- |
| Background      | Dark      | `#121212` |
| Card Background | Dark Grey | `#1E1E1E` |
| Primary Text    | White     | `#FFFFFF` |
| Secondary Text  | Grey      | `#B0B0B0` |
| Divider         | Grey      | `#2C2C2C` |

---

## Scoring Colors

| Action             | Color      | Hex       |
| ------------------ | ---------- | --------- |
| Run Button         | Blue       | `#1976D2` |
| Boundary Highlight | Light Blue | `#42A5F5` |
| Extras             | Orange     | `#FB8C00` |
| Wicket             | Red        | `#E53935` |
| Undo / Neutral     | Grey       | `#616161` |
| Confirm Action     | Green      | `#2E7D32` |

---

## Ball Timeline Colors

| Ball Result | Color     |
| ----------- | --------- |
| Dot Ball    | `#616161` |
| Runs        | `#1976D2` |
| Boundary    | `#42A5F5` |
| Extra       | `#FB8C00` |
| Wicket      | `#E53935` |

---

# 3. Typography

Use a **simple hierarchy**.

| Usage          | Font Size | Weight   |
| -------------- | --------- | -------- |
| Match Result   | 32        | Bold     |
| Score Display  | 36        | Bold     |
| Section Title  | 20        | SemiBold |
| Button Text    | 22        | Bold     |
| Labels         | 16        | Medium   |
| Secondary Info | 14        | Regular  |

---

# 4. Button Design

All scoring buttons must be **large and easy to press**.

| Property      | Value |
| ------------- | ----- |
| Height        | 70 px |
| Minimum Width | 90 px |
| Border Radius | 12 px |
| Font Size     | 22    |
| Font Weight   | Bold  |
| Elevation     | 2–4   |

Spacing between buttons:

```
12 px
```

---

# 5. Run Button Layout

Run buttons should appear in a **3 × 2 grid**.

```
0   1   2
3   4   6
```

Grid properties:

| Property       | Value |
| -------------- | ----- |
| Columns        | 3     |
| Row spacing    | 12 px |
| Column spacing | 12 px |
| Button Height  | 70 px |

---

# 6. Extras Button Layout

Extras should appear **below run buttons**.

Layout:

```
Wide       No Ball
Bye        Leg Bye
```

Properties:

| Property | Value |
| -------- | ----- |
| Height   | 60 px |
| Radius   | 10 px |
| Spacing  | 12 px |

---

# 7. Wicket Button

The wicket button must be visually dominant.

| Property    | Value      |
| ----------- | ---------- |
| Height      | 70 px      |
| Color       | `#E53935`  |
| Font Size   | 22         |
| Font Weight | Bold       |
| Width       | Full width |

---

# 8. Undo Button

Undo should be accessible but visually neutral.

| Property | Value     |
| -------- | --------- |
| Height   | 60 px     |
| Color    | `#616161` |
| Icon     | Undo icon |
| Radius   | 10 px     |

---

# 9. Score Card

The score card appears at the **top of the screen**.

Example layout:

```
TEAM A

54 / 3
Overs 5.2

Striker: Dhoni
Non-Striker: Jadeja
```

Properties:

| Property      | Value     |
| ------------- | --------- |
| Height        | 120 px    |
| Padding       | 16 px     |
| Corner Radius | 12 px     |
| Background    | `#1E1E1E` |

---

# 10. Ball Timeline

Displays ball history for the current over.

Example:

```
1 0 4 W 2 1
```

Each ball should appear as a **circular indicator**.

| Property  | Value |
| --------- | ----- |
| Width     | 36 px |
| Height    | 36 px |
| Radius    | 18 px |
| Spacing   | 8 px  |
| Text Size | 16    |

---

# 11. Screen Spacing Rules

Consistent spacing improves readability.

| Element        | Spacing |
| -------------- | ------- |
| Screen Padding | 16 px   |
| Widget Gap     | 12 px   |
| Section Gap    | 20 px   |
| Card Padding   | 16 px   |

---

# 12. Over Summary Screen

After every 6 balls, display a reconciliation screen.

Example layout:

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

Confirm Over
Edit Over
```

Properties:

| Property              | Value |
| --------------------- | ----- |
| Card Radius           | 12 px |
| Padding               | 20 px |
| Confirm Button Height | 60 px |

---

# 13. Result Screen

Displays the match result.

Example:

```
TEAM B WON

Score
76 / 3

Overs
5.4
```

Typography:

| Element      | Size |
| ------------ | ---- |
| Result Title | 32   |
| Score        | 28   |
| Labels       | 18   |

---

# 14. Touch Interaction Requirements

All scoring actions must respond instantly.

Recommended feedback:

| Action     | Feedback                     |
| ---------- | ---------------------------- |
| Run Scored | Light vibration              |
| Boundary   | Strong vibration             |
| Wicket     | Strong vibration + highlight |
| Undo       | Light vibration              |

---

# 15. Orientation

The application should be locked to:

```
Portrait Mode
```

---

# 16. Layout Structure (Main Scoring Screen)

The scoring screen should follow this vertical structure:

```
Score Card
Ball Timeline
Run Buttons Grid
Extras Buttons
Wicket Button
Undo Button
```

---

# 17. Accessibility

Ensure readability during bright daylight.

Requirements:

* Minimum text contrast ratio: **4.5:1**
* Large button sizes
* Avoid light backgrounds
* Avoid small text

---

# 18. Performance Constraints

Because the app is **offline and non-persistent**, UI must remain lightweight.

Requirements:

* No network calls
* No database usage
* State kept in memory
* Instant UI updates (< 50 ms)

