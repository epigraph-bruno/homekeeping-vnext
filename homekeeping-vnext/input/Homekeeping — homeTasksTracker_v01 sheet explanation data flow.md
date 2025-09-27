# **Homekeeping — User-Driven Product Spec (Flutter \+ Firebase)**

## **1\) Purpose & Goals (plain language)**

* Keep a household’s recurring chores on track with **simple daily/weekly/monthly agendas**, shared across 2+ people (e.g., BG & KG).

* Make logging a completion **one tap** and always reliable (offline-friendly, instant feedback).

* Keep analytics **useful but light**: weekly completion rate, time by task group, workload by person.

* Avoid admin UIs for now: **the XLSX uploaded to Firebase Storage is the single source of truth** for tasks, users, groups, and settings. Importing a new sheet updates the system.

**Non-goals (MVP):**

* No in-app task editing, invites, or permissions UI.

* No complex auth; **Google Sign-In only**.

* No push notifications in v1 (optional later).

---

## **2\) Primary User Stories**

1. **As a household member,** I sign in with Google and see **Today**, **Week**, **Month**, **Done**, **Metrics**.

2. **As a member,** I open **Today** and see the tasks expected today, filtered to **Mine** (tasks assigned to me \+ shared tasks). I can toggle **All** to see everything.

3. **As a member,** I tap ✓ to mark a task done. It immediately records in the **Done** log and disappears/greys out.

4. **As a member,** I can undo within the same screen or from **Done**.

5. **As a member,** I can glance at **Metrics** to see:

   * **Week So Far** (expected vs. done, rate %),

   * **Time by Task Group**, and

   * **Workload by Person**.

6. **As an admin,** I drop an **XLSX file** into Firebase Storage. Within a minute, the system imports it and **regenerates agendas** so the app reflects new tasks/durations/assignments/settings.

---

## **3\) How it Works (from the user’s POV)**

* **Auth:** tap “Sign in with Google” → app opens; if not provisioned in the XLSX (by email/code), show a friendly “Not provisioned, contact admin” screen.

* **Agenda logic:**

  * **Today**: day tasks matching Day/Workday/Weekend \+ “roll-in” week tasks near week end.

  * **Week**: week tasks \+ near-end month roll-ins.

  * **Month**: month tasks.

  * Overnight (1am **America/Chicago**), the server regenerates these buckets and handles “not done” grace rules.

* **Done:** a timeline of completions with per-day grouping; tap any entry to undo.

* **Metrics:** fetch computed numbers from server callables.

---

## **4\) Inputs (the Spreadsheet)**

Single XLSX with sheets:

* **Users**: `Email`, `Display Name`, `Code (BG/KG)`, `Timezone?`

* **Groups**: `Group ID`, `Name`

* **Tasks**:  
   `Task ID`, `Name`, `Repeat Unit (DAY/WEEK/MONTH)`, `Repeat Interval`,  
   `Times Per Period`, `Daily_Mode (EVERYDAY/WORKDAYS/WEEKENDS)`,  
   `AssignedTo ("BG","KG","BG,KG" or blank=shared)`,  
   `requireBoth (TRUE/FALSE)`, `Avg Task Duration (min)`, `Group ID`, `Active (TRUE/FALSE)`, `Notes`

* **Settings**: `Section`, `Key`, `Value`  
   (e.g., `AgendaRules.WeekStart=Monday`, `Roll_Week_to_Today_Days=2`, `Roll_Month_to_Week_Days=7`,  
   `Metrics.HoursPerTap_Default=0.5`, `Grace.Daily=7`, `Grace.Weekly=7`, `Grace.Monthly=30`)

**Import UX (admin):** upload the file to Storage `/imports/…xlsx`. That’s it.

---

## **5\) MVP Scope (what must work end-to-end)**

* **Auth**: Google Sign-In (FirebaseAuth), provision check.

* **XLSX Import**: Storage trigger → parse → upsert Firestore (users, groups, tasks, settings) → call `regenerateAgendas`.

* **Agenda Regeneration**: Cloud Function, nightly \+ on import. Creates **Today / Week / Month** documents for the current periods (Chicago TZ).

* **App Tabs**:

  * Today/Week/Month (list with Mine/All toggle, ✓/undo).

  * Done (chronological log).

  * Metrics (3 summary cards).

* **Events**: tapping ✓ creates a server-validated event; undo adds a compensating −1 (with dedup rules).

* **Offline**: Firestore’s offline caching enabled; optimistic UI on ✓/undo.

---

## **6\) Architecture & Data (implementation-ready summary)**

* **Flutter**: `firebase_core`, `firebase_auth`, `google_sign_in`, `cloud_firestore`, `firebase_functions`, `firebase_storage`, `go_router`, `flutter_riverpod`, `intl`.

**Firestore (Native/Datastore mode)**

 `/users/{uid}            { email, displayName, code:"BG|KG", timezone, active }`  
`/groups/{groupId}       { name }`  
`/tasks/{taskId}         { name, cadenceUnit, cadenceInterval, timesPerPeriod,`  
                          `dailyMode, assignedTo[], requireBoth, avgMinutes?,`  
                          `groupId?, active, notes? }`  
`/agendas/{periodKey}/items/{id}`  
                        `{ taskId, bucket:"TODAY|WEEK|MONTH", periodDate, dueDate,`  
                          `cadenceUnit, dailyMode, assignedTo[], expectedTaps,`  
                          `locked, archived, archivedOn? }`  
`/events/{yyyy-mm}/entries/{id}`  
                        `{ taskId, date, userCode, count:+1|-1, createdAt }`  
`/settings/global        { agendaRules:{...}, metrics:{...}, grace:{...} }`  
`/importsLogs/{id}       { counts, errors[] }`

*   
* **Functions**:

  * `onImportXlsx` (Storage trigger): parse & upsert; write `/importsLogs`; call `regenerateAgendas`.

  * `regenerateAgendas` (HTTPS \+ Cloud Scheduler 1:00 AM Chicago): compute Today/Week/Month; update `/agendas/*`.

  * `addEvent` (Callable): ✓/undo, dedup by `(taskId,date,userCode)`.

  * Metrics callables: `metricsWeekSoFar`, `timeByGroup`, `workloadByPerson`, `individualChart`.

---

## **7\) Acceptance Criteria (MVP)**

* Uploading the XLSX updates tasks/users/settings and produces fresh agendas within 1 minute.

* Today/Week/Month show the right items according to rules (workday/weekend, roll-ins).

* ✓ adds a completion; the row reflects completion immediately; **Done** shows the entry; **undo** reverses it.

* Metrics return sensible numbers and update after ✓/undo.

* Offline: completing while offline updates UI; sync succeeds when back online.

* No crashes on iOS simulator or iPhone; Sign-In is one tap and always returns to main tabs.

---

## **8\) Risks & Guardrails**

* **Auth mismatch**: if a user signs in but isn’t in `Users` sheet, show the “Not provisioned” screen (no silent failure).

* **Spreadsheet quality**: strict schema validation with clear error log in `/importsLogs`.

* **Time zones**: compute dates in **America/Chicago** on the server for agendas; compute event “day” using user’s stored timezone (default Chicago) to avoid off-by-one.

---

## **9\) Deliverables & Milestones (agent can reorder with rationale)**

**Milestone A — Skeleton & Sign-In**

* Flutter app boot \+ Google Sign-In

* Guarded routes and “Not provisioned” screen

* Firestore rules (read for authed, writes via Functions except events)

**Milestone B — Import & Regeneration**

* `onImportXlsx` implemented; XLSX template sample committed

* `regenerateAgendas` implemented; Cloud Scheduler (1am Chicago)

**Milestone C — Today/Week/Month \+ Done**

* Streams \+ Mine/All toggle; ✓/undo via `addEvent`

* Done timeline \+ undo

**Milestone D — Metrics**

* 3 cards wired to callables

* Basic charts or simple cards (agent’s choice)

**Milestone E — Polish**

* Offline tests, error toasts, performance checks

* Minimal unit tests for agenda logic & metrics

