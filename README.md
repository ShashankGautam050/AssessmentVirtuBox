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
