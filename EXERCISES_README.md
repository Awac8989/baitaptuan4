# Flutter Exercises Collection

This Flutter project contains 5 comprehensive exercises covering various Flutter and Dart concepts.

## Exercises Overview

### 1. List View Exercise ✅
**Location**: `lib/exercises/list_view_exercise.dart`

**Features**:
- Scrollable list of 15 contacts
- Each contact includes a placeholder avatar image (colored CircleAvatar with initials)
- Contact information: name, phone, email
- Tap interaction with SnackBar feedback
- Material Design cards with proper styling

**What it demonstrates**:
- ListView.builder for efficient list rendering
- Custom widgets (ContactTile)
- Data modeling (Contact class)
- Material Design components

---

### 2. Grid View Exercise ✅
**Location**: `lib/exercises/grid_view_exercise.dart`

**Section 1: GridView.count()**
- Fixed columns: 3
- Row spacing: 8
- Column spacing: 8
- Aspect ratio: 1
- Title: "Fixed Column Grid"

**Section 2: GridView.extent()**
- Max cross-axis extent: 150
- Row spacing: 10
- Column spacing: 10
- Aspect ratio: 0.8
- Title: "Responsive Grid"

**Features for each section**:
- 12 grid items with colored containers
- Rounded corners and borders
- Centered icons with labels
- Responsive design

**What it demonstrates**:
- GridView.count() vs GridView.extent()
- Grid layout principles
- Custom grid item widgets
- Material icons and styling

---

### 3. SharedPreferences Exercise ✅
**Location**: `lib/exercises/shared_preferences_exercise.dart`

**Core Features**:
- Save Name button → stores username
- Show Name button → retrieves and displays username
- TextField for name input
- Proper handling when no data is available

**Bonus Features Implemented**:
- ✅ Clear button to remove saved data
- ✅ Additional fields: age, email
- ✅ Display last saved timestamp
- ✅ Real-time data display
- ✅ Input validation

**What it demonstrates**:
- SharedPreferences for local data persistence
- Async/await patterns
- Form handling and validation
- State management
- DateTime handling

---

### 4. Asynchronous Programming Exercise ✅
**Location**: `lib/exercises/async_exercise.dart`

**Task Implementation**:
1. Displays "Loading user..." with loading indicator
2. Waits for 3 seconds using `Future.delayed()`
3. Shows "User loaded successfully!"
4. Auto-resets after 2 seconds

**Additional Features**:
- Visual loading states with CircularProgressIndicator
- Status icons that change based on state
- Quick Task button (800ms delay)
- Slow Task button (5s delay)
- Proper widget lifecycle management

**What it demonstrates**:
- Future.delayed() for async operations
- Loading state management
- UI updates with setState()
- Widget lifecycle (mounted check)
- Multiple async operations

---

### 5. Isolate Exercises ✅
**Location**: `lib/exercises/isolate_exercises.dart`

#### Challenge 1: Heavy Computation
**Features**:
- Calculate factorial of large numbers (up to 10,000)
- Uses `compute()` function (isolate wrapper)
- Shows loading progress indicator
- Displays results with truncation for very long numbers
- Input validation and error handling

#### Challenge 2: Background Isolate Communication
**Features**:
- Spawns background isolate using `Isolate.spawn()`
- Worker isolate sends random numbers every second
- Main isolate receives and sums the numbers
- When sum > 100, sends stop command to worker
- Worker isolate exits gracefully using `Isolate.exit()`
- Real-time message logging
- Proper isolate cleanup

**What it demonstrates**:
- Heavy computation without blocking UI
- Isolate communication with SendPort/ReceivePort
- Background processing
- Isolate lifecycle management
- Inter-isolate messaging

---

## Project Structure

```
lib/
├── main.dart                     # Navigation hub for all exercises
└── exercises/
    ├── list_view_exercise.dart   # Exercise 1
    ├── grid_view_exercise.dart   # Exercise 2
    ├── shared_preferences_exercise.dart # Exercise 3
    ├── async_exercise.dart       # Exercise 4
    └── isolate_exercises.dart    # Exercise 5
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  shared_preferences: ^2.2.2  # For local data persistence
```

## How to Run

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to launch the app
4. Navigate through exercises using the main menu

## Key Learning Outcomes

- **ListView**: Efficient list rendering and custom widgets
- **GridView**: Responsive grid layouts with different approaches
- **SharedPreferences**: Local data persistence and async operations
- **Async Programming**: Future handling and loading states
- **Isolates**: Heavy computation and background processing

Each exercise is self-contained and demonstrates specific Flutter/Dart concepts with practical implementations.