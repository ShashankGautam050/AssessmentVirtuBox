# AssessmentVirtuBox – iOS To-Do Application

## Overview

AssessmentVirtuBox is an iOS To-Do application developed as part of a technical assessment.  
The app is built using SwiftUI and follows modern iOS development practices.

- Authentication is implemented locally (as allowed by the assessment).
- Task data is stored persistently using Core Data.
- The app supports multiple users, and each user can only access their own tasks.

---

## Key Functional Requirements

### 1. Authentication
- Authentication is implemented locally.
- User login state is managed using UserDefaults.
- Logout functionality is provided with a confirmation alert.
- On logout, the current user session is cleared.

### 2. Database
- Core Data is used as the local database.
- Tasks persist across app launches.
- Each task is associated with a specific user.
- Data is filtered using Core Data predicates to ensure user isolation.

### 3. Task Management (CRUD)
- Create: Add a new task
- Read: Display tasks belonging to the logged-in user
- Update: Edit an existing task
- Delete: Remove a task using swipe-to-delete

---

## Features

- SwiftUI-based user interface
- NavigationStack for navigation
- Sheet presentation for Add/Edit task
- Core Data integration using @FetchRequest
- User-specific data isolation
- Offline-first functionality
- Clean and minimal UI

---

## Technology Stack

- Language: Swift
- UI Framework: SwiftUI
- Database: Core Data
- Authentication: Local (UserDefaults)
- Platform: iOS 17+
- Architecture: MVVM-style separation (Views, Models, Utilities)

---

## Core Data Model

### Entity: TaskEntity

| Attribute  | Type  | Description |
|----------|------|-------------|
| id       | UUID | Unique identifier |
| title    | String | Task title |
| userEmail | String | Email of the logged-in user |

---

## User-Specific Data Handling

The app supports multiple users, and each user only sees their own tasks.

### Implementation Details
- The logged-in user’s email is stored in UserDefaults.
- Each task is saved with a userEmail attribute.
- Tasks are fetched using an NSPredicate that filters tasks for the logged-in user only.

---

## Application Flow

1. User logs in using local authentication.
2. The Home screen displays only the tasks created by the logged-in user.
3. User can add a new task.
4. Tapping a task allows editing.
5. Tasks can be deleted using swipe gesture.
6. Logout clears the session and returns the user to the login screen.

---

## Manual Test Cases

### 1. User Authentication

#### 1.1 Sign Up – Valid Data
Steps:
1. Open the app
2. Navigate to Sign Up
3. Enter a valid email
4. Enter a password (minimum 8 characters)
5. Enter matching confirm password
6. Tap Sign Up

Expected Result:
- User account is created successfully
- User data is stored locally

---

#### 1.2 Sign Up – Invalid Data
Steps:
1. Leave fields empty or enter mismatched passwords
2. Tap Sign Up

Expected Result:
- Validation error message is displayed

---

### 2. Login

#### 2.1 Login – Valid Credentials
Steps:
1. Enter registered email and password
2. Tap Login

Expected Result:
- User is logged in
- Home screen is displayed

---

#### 2.2 Login – Invalid Credentials
Steps:
1. Enter incorrect email or password
2. Tap Login

Expected Result:
- Error message is shown

---

### 3. Task Management

#### 3.1 Add Task
Steps:
1. Tap Add Task
2. Enter task title
3. Save

Expected Result:
- Task appears in list
- Task is saved in Core Data for the current user

---

#### 3.2 Edit Task
Steps:
1. Tap an existing task
2. Modify title
3. Update

Expected Result:
- Task is updated
- Changes persist after relaunch

---

#### 3.3 Delete Task
Steps:
1. Swipe left on a task
2. Tap Delete

Expected Result:
- Task is removed from list
- Task is deleted from Core Data

---

### 4. Logout

#### 4.1 Logout User
Steps:
1. Tap Logout
2. Confirm logout

Expected Result:
- User session is cleared
- User is returned to Login screen

---

### 5. Data Persistence

#### 5.1 App Relaunch
Steps:
1. Close the app
2. Reopen the app

Expected Result:
- User remains logged in (if not logged out)
- Tasks load correctly from Core Data

---

## Git Usage

- Meaningful commit messages
- Logical separation of features per commit
- No generated or sensitive files committed
- Clean commit history following Git best practices

---

## Notes

- Authentication is implemented locally as allowed.
- Core Data is used strictly for database purposes.
- No third-party libraries are used.
- The app works fully offline.

---

## Developer

Shashank Gautam

---

## Conclusion

This project demonstrates a complete SwiftUI-based To-Do application using Core Data, local authentication, and user-specific data isolation, fully aligned with the assessment requirements.
