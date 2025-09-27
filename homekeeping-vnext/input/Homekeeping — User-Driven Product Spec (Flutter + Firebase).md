# **What each tab represents (plain language)**

## **Admin / source-of-truth tabs (you edit these)**

* **Tasks** — master catalog of chores. Columns in your file:

  * `Task ID`, `Name`, `Repeat Unit` (DAY/WEEK/MONTH), `Repeat Interval` (int), `Times Per Period` (int),

  * `requireBoth` (TRUE/FALSE), `AssignedTo` (BG / KG / BG,KG or blank for shared),

  * `Active` (TRUE/FALSE), `Notes / Instructions`, `Avg Task Duration (min)`,

  * `Daily_Mode` (EVERYDAY / WORKDAYS / WEEKENDS), `Interval` (legacy; redundant with Repeat Interval), `Group ID`.

* **Groups** — the canonical list of task groups: `Group ID`, `Group Name`.

* **Users** — who can use the system: `Email`, `Code (BG/KG)`, `DisplayName`, `IsAdmin`.

* **Settings** — tunable behavior: `Section`, `Key`, `Value`, `Notes`. (e.g., week start, roll-ins, grace windows, default hours per tap).

These four drive the import process. Upload a new .xlsx and the backend will upsert users, groups, tasks, and settings.

## **System/derived tabs (examples in your file; the app will write these)**

* **Ex\_eventTracker** — normalized log of taps:

  * `EventID`, `Date (yyyy-mm-dd)`, `Task ID`, `Who (BG / KG)`, `+/- Count` (tap or undo).

* **Ex\_agendaToday** / **Ex\_agendaWeek** / **Ex\_agendaMonth** — example shape of the three buckets the app shows:

  * Columns: `Task`, `AssignedTo`, `DueDate`, `Cadence`, `Daily_Mode`, `Key`.

* **Ex\_DoneOnTimeFromActiveAgendas** — items completed on time (for analytics):

  * `Task`, `CompletedOn`, `AssignedTo`.

* **Ex\_historicalDone(notActiveDone** — historical done records even if tasks later deactivated:

  * `Task`, `CompletedOn`, `AssignedTo`.

* **Ex\_NoDoneWithinGrace** — not done yet but still within grace:

  * `Task`, `Was to be completed on`, `In grace till`, `AssignedTo`.

* **Ex\_historicalNotDone(pastGrace)** — didn’t get done and grace expired (locked/archived):

  * `Task`, `Was to be completed on`, `Was in grace till`, `Archived in this not done list on`, `AssignedTo`.

(Your workbook actually contains these tabs with the exact headers above, so we can ingest and generate in this shape immediately.)

# **Data flow & user journey (end-to-end)**

## **1\) Admin uploads spreadsheet (the only way we change structure for now)**

* You upload the .xlsx (`Tasks`, `Groups`, `Users`, `Settings`).

* Backend parses, **validates**, and **upserts**:

  * Users (match on Email; set `code`, `displayName`, `isAdmin`),

  * Groups (by `Group ID`/name),

  * Tasks (by `Task ID`; normalize cadence & daily mode),

  * Settings (AgendaRules, Metrics, Grace).

* After import succeeds, backend **regenerates agendas** (see step 3).

## **2\) Member signs in (iOS / Android, Google Sign-In only)**

* If `email` exists in **Users**, the app loads the household’s data (Today/Week/Month, Done log, Metrics).

* If not provisioned, the app shows a friendly “Not provisioned; ask admin to add you to the Users sheet” message.

## **3\) Nightly regeneration (1:00 AM America/Chicago)**

* Read **Settings** (week start, roll-ins, grace windows).

* Build the three **agendas**:

  * **Today**: all **DAY** tasks that match today’s **Daily\_Mode** (Everyday/Workdays/Weekends). Also include **WEEK** tasks if within “roll week → today” window.

  * **Week**: all **WEEK** tasks for this week. Also include **MONTH** tasks if within “roll month → week” window.

  * **Month**: all **MONTH** tasks due this month.

  * Each agenda row captures a snapshot: `taskId`, `bucket`, `periodDate`, `dueDate`, `cadenceUnit`, `dailyMode`, `assignedTo[]`, `expectedTaps`.

* **Not Done / Grace handling**:

  * For any agenda row from a **prior period** that didn’t get enough taps:

    * Create/keep a record in **“not done (within grace)”** with `graceUntil` based on bucket (Daily: \+7d, Weekly: \+7d, Monthly: \+30d).

    * When grace expires, mark **locked \+ archived** in **historical not-done**.

* Metrics precomputation (optional v1): compute weekly expected/done counters for speed.

## **4\) Member uses the app during the day**

* **Today / Week / Month tabs**:

  1. Default filter **Mine** \= tasks with `AssignedTo` containing my code **or** shared (empty AssignedTo).

  2. Toggle to **All** to see every household task.

  3. Each row shows `Task`, and a subtitle `MMM d • Day|Week|Month (Daily_Mode if not Everyday)`.

  4. **Complete (✓)**: posts an event `{taskId, date, userCode, count:+1}` and updates the row immediately (optimistic UI; offline friendly).

  5. **Undo**: posts `{count:-1}` if there’s a positive tap to remove for that day/user.

* **Done tab**: reverse-chronological list from **Ex\_eventTracker**. Undo available here too.

* **Metrics tab** (simple and accurate):

  1. **Week So Far** — `Expected` vs `Done`:

     * **Expected**: count agenda items due this week (DAY items count 1 per valid day; WEEK items use `Times Per Period`; MONTH roll-ins counted in WEEK).

     * **Done**: count **distinct** `(taskId, date)` taps this week from **Ex\_eventTracker**, **excluding personal-only tasks** (BG/KG-only) from the main metric.

     * **RateSoFar** \= `Done / Expected`.

  2. **Time by Task Group (hours)**: sum hours \= `(avgMinutes || default)/60 * distinct taps`, grouped by `Group ID`, with an “(Ungrouped)” bucket for missing mapping.

  3. **Workload by Person (hours)**: same hours calc, grouped by `BG` and `KG`.

  4. **Individual**: personal-only tasks **only**, shown in a separate chart, excluded from (1–3).

# **What you already gave me (and how it maps)**

* **Workbook** `homeTasksTracker_v01.xlsx` with:

  * Admin tabs: `Tasks`, `Groups`, `Users`, `Settings`.

  * Example/system tabs: `Ex_eventTracker`, `Ex_agendaToday`, `Ex_agendaWeek`, `Ex_agendaMonth`, `Ex_DoneOnTimeFromActiveAgendas`, `Ex_historicalDone(notActiveDone`, `Ex_NoDoneWithinGrace`, `Ex_historicalNotDone(pastGrace)`.

  * This is perfect for seeding the backend and validating the agent’s first pass at parsers and generation.

* **Firebase config files**:

  * Android `google-services.json` (Project ID `homekeeping-d424c`, Android package `com.homekeeping.app`, Storage bucket), which looks consistent for iOS too (bundle `com.homekeeping.app`).  
     google-services

  * iOS `GoogleService-Info.plist` (received).

