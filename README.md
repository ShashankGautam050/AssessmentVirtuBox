# AssessmentVirtuBox – iOS To-Do Application

## Overview

AssessmentVirtuBox is an iOS To-Do application developed as part of an assessment.  
The application is built using **SwiftUI** and follows modern iOS development practices.  
User authentication is handled **locally**, while task data is stored persistently using **Core Data**.

---

### 1. Authentication
- Authentication is implemented **locally** as permitted by the assessment guidelines.
- User login state is maintained within the app.
- Logout functionality is provided with a confirmation alert.

### 2. Database
- The application uses **Core Data** as the local database.
- Task data is persisted across app launches.
- No external database or network dependency is required.

### 3. Task Management (CRUD)
- **Create**: Add a new task
- **Read**: Display all saved tasks
- **Update**: Edit an existing task
- **Delete**: Remove a task using swipe-to-delete

---

## Features

- SwiftUI-based user interface
- NavigationStack for navigation
- Sheet presentation for Add/Edit task
- Core Data integration using `@FetchRequest`
- Clean and simple user experience
- Offline-first functionality

---

## Technology Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Database:** Core Data
- **Platform:** iOS 17+ (Minimum Deployment Target)


---

## Core Data Model

### Entity: `TaskEntity`

| Attribute | Type | Description |
|--------|------|------------|
| `id` | UUID | Unique identifier |
| `title` | String | Task title |

---

## Application Flow

1. User logs in using local authentication.
2. The Home screen displays the list of saved tasks.
3. User can add a new task using the menu option.
4. Tapping on an existing task allows editing.
5. Tasks can be deleted via swipe gesture.
6. Logout clears the authentication state.

---
##  Manual Test Cases

### 1. User Authentication

#### 1.1 Sign Up – Valid Data
- **Steps**
  1. Open the app
  2. Navigate to Sign Up screen
  3. Enter a valid email
  4. Enter a password with minimum 8 characters
  5. Enter matching confirm password
  6. Tap on Sign Up
- **Expected Result**
  - User account is created successfully
  - User data is stored locally using Core Data

#### 1.2 Sign Up – Empty Fields
- **Steps**
  1. Leave email or password field empty
  2. Tap on Sign Up
- **Expected Result**
  - Validation error message is shown

#### 1.3 Sign Up – Password Mismatch
- **Steps**
  1. Enter password and different confirm password
  2. Tap on Sign Up
- **Expected Result**
  - Error message is shown indicating password mismatch

---

### 2. Login

#### 2.1 Login – Valid Credentials
- **Steps**
  1. Open Login screen
  2. Enter registered email and correct password
  3. Tap on Login
- **Expected Result**
  - User is logged in successfully
  - User is navigated to Home (To-Do List) screen

#### 2.2 Login – Invalid Credentials
- **Steps**
  1. Enter incorrect email or password
  2. Tap on Login
- **Expected Result**
  - Error message is shown for invalid credentials

---

### 3. To-Do List (CRUD Operations)

#### 3.1 Add New Task
- **Steps**
  1. Tap on Add Task button
  2. Enter task title
  3. Tap on Save
- **Expected Result**
  - Task is added to the list
  - Task is saved in Core Data

#### 3.2 Edit Task
- **Steps**
  1. Tap on an existing task
  2. Modify the task title
  3. Tap on Update
- **Expected Result**
  - Task is updated successfully
  - Updated task persists after app relaunch

#### 3.3 Delete Task
- **Steps**
  1. Swipe left on a task
  2. Tap Delete
- **Expected Result**
  - Task is removed from the list
  - Task is deleted from Core Data

---

### 4. Logout

#### 4.1 Logout User
- **Steps**
  1. Tap on Logout option
  2. Confirm logout action
- **Expected Result**
  - User is logged out
  - User is redirected to Login screen

---

### 5. Data Persistence

#### 5.1 App Relaunch
- **Steps**
  1. Close the app
  2. Reopen the app
- **Expected Result**
  - Logged-in state is preserved (if not logged out)
  - All saved tasks are loaded from Core Data

## How to Run the Project

1. Open the project in Xcode.
2. Ensure the Core Data model file is named:
3. Select an iOS simulator or device.
4. Build and run the application.

---

## Notes

- Authentication is implemented locally as allowed by the assessment.
- Core Data is used strictly for database purposes.
- The app works fully offline.


---

## Developer

**Shashank Gautam**

---

## Conclusion

This project demonstrates the use of SwiftUI and Core Data to build a functional and persistent To-Do application while adhering strictly to the assessment requirements.
