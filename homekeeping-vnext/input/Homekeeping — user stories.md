# **Homekeeping — User Stories (MVP)**

## **Vision**

Homekeeping helps two household members (BG and KG) stay organized around recurring tasks.  
 Tasks are defined in a spreadsheet and automatically turned into **daily, weekly, and monthly agendas**.  
 Each person can log in, see what needs to be done, and mark tasks complete.

---

## **User Roles**

* **Household Member (BG/KG):**  
   Can log in, see tasks, mark tasks done/undone, and view progress/metrics.

* **Admin (same members for now):**  
   Updates the spreadsheet with new tasks, users, groups, or settings, then re-uploads.  
   No in-app editing yet — the XLSX is the single source of truth.

---

## **Core User Stories**

### **Authentication**

* As a member, I log in with my Google account.

* The app recognizes me by my `Code` (BG or KG) from the `Users` tab in the spreadsheet.

* If my email isn’t in the sheet, I cannot proceed.

---

### **Agenda**

* As a member, I open the app and see **Today**, **This Week**, and **This Month** tabs.

* Each tab lists tasks from the `Tasks` sheet that are active for that timeframe.

* Workday vs weekend logic (Daily\_Mode) is applied so the right tasks show up.

* Tasks roll down if not completed (month → week → today) with grace periods applied.

* I can tap ✓ to mark a task done.

---

### **Undo / Dedup**

* As a member, I can undo a ✓ (to fix mistakes).

* Each task can only count once per period per user, even if I tap multiple times.

---

### **Done log**

* As a member, I can go to the **Done** tab to see a timeline of what was completed.

* This log uses the `Done_Normalized` table (deduped, clean record).

* Unlike Events (raw taps), Done is simple: task, who, when.

---

### **Metrics**

* As a member, I can view **Metrics**:

  * Completion rate this week (expected vs done).

  * Time by task group (hours).

  * Workload by person (hours split).

* Metrics exclude purely personal tasks (AssignedTo \= one user only).

* Shared tasks (no AssignedTo) count toward both/all.

---

### **Settings**

* As an admin, I can adjust behavior via the `Settings` tab:

  * When the week starts (Monday).

  * How many days before period end tasks roll down.

  * Hours per tap default.

  * Grace periods.

* Changes are only applied after re-uploading the XLSX.

---

## **System Behavior**

* Every night at 1 AM America/Chicago:

  * Agendas regenerate (Today, Week, Month).

  * Grace is applied for overdue items.

* Whenever a member taps ✓:

  * An event is written.

  * Functions dedupe and update Done \+ agendas.

* The app is offline-friendly; taps sync when online.

---

## **Out of Scope (MVP)**

* In-app task creation or editing.

* More than 2 users.

* Advanced auth roles.

* Holiday calendars (only workdays/weekends).

* Push notifications.

