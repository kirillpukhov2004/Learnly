# Learnly
This project was created during the iOS Internship at Innowise company.
Learnly is an iOS application which allows users to browse different learning courses.

## Build & Run
In order to run application or tests you should follow these steps:

### Requirements
- Xcode (iOS 17.0+ / Swift 6)
- Tuist (`brew install tuist`)
- SwiftLint (`brew install swiftlint`)

Generate Xcode project:
```bash
tuist install
tuist generate
```

### Run application
1. Specify "Development Team" inside "Learnly" target settings
2. Select "Learnly" scheme
3. Choose the device you desire to run application on
4. Press `Cmd + R`

### Run tests
1. Specify "Development Team" inside "LearnlyTests" target settings
2. Choose the device you desire to run tests on
3. Press `Cmd + U`
