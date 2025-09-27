# Homekeeping vNext

A Flutter + Firebase app for managing household tasks between two people.

## Features

- Google Sign-In authentication with user provisioning
- Daily/Weekly/Monthly task management
- Workday/Weekend task scheduling
- Roll-in system for upcoming tasks
- Grace period handling for overdue tasks
- Batch completion with undo support
- Progress metrics and time tracking
- Offline support
- Admin XLSX import for task management

## Setup

### Prerequisites

- Flutter SDK (latest stable)
- Firebase CLI
- Node.js (for Firebase Functions)
- iOS/Android development setup

### Local Development

1. Clone the repository:
```bash
git clone https://github.com/epigraph-bruno/homekeeping-vnext.git
cd homekeeping-vnext
```

2. Install dependencies:
```bash
# Flutter dependencies
flutter pub get

# Firebase Functions dependencies
cd functions
npm install
cd ..
```

3. Add Firebase configuration:
- Place `google-services.json` in `android/app/`
- Place `GoogleService-Info.plist` in `ios/Runner/`
- Or use provided files in `firebase-config/`

4. Run the app:
```bash
flutter run
```

### Firebase Setup

1. Create a new Firebase project
2. Enable required services:
   - Authentication (Google Sign-In)
   - Firestore
   - Cloud Functions
   - Cloud Storage

3. Deploy Firebase configuration:
```bash
cd functions
npm run deploy
```

## Project Structure

- `lib/` - Flutter application code
  - `models/` - Data models
  - `services/` - Business logic
  - `providers/` - State management
  - `screens/` - UI screens
  - `widgets/` - Reusable widgets
  - `utils/` - Helper functions

- `functions/` - Firebase Cloud Functions
  - `src/` - TypeScript source code
  - `lib/` - Compiled JavaScript

- `test/` - Test files
  - `services/` - Service tests
  - `screens/` - Widget tests
  - `utils/` - Test utilities

## Testing

Run tests:
```bash
flutter test
```

## Admin Tasks

Task management is handled through XLSX files uploaded to Firebase Storage:

1. Update the template XLSX file
2. Upload to Firebase Storage `/imports/`
3. System will automatically:
   - Validate the file
   - Update tasks/users/settings
   - Regenerate agendas

## License

Private repository - All rights reserved
