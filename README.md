# 📰 NYT Articles App (SwiftUI)

This is a simple iOS app built using **SwiftUI** that displays the most popular articles from the **New York Times API**. It was created as part of a technical challenge and follows a clean architecture pattern in a lightweight way.

---

## ✨ Features

- Fetches popular articles from the NYT API
- Displays a list of article titles, authors, and publish dates
- Tap to view article details, including an abstract and link
- Saves articles locally using `UserDefaults`
- Loads cached articles when offline
- Basic error handling with alerts
- A simple unit test for the ViewModel using a mock repository

---

## 🧱 Architecture

This project uses a simplified version of **Clean Architecture**:

```
Presentation (SwiftUI Views + ViewModels)
│
├── Domain (UseCases + Protocols)
│
└── Data (API Service + Repository Implementation + Cache)
```

I used MVVM and kept logic separated so the codebase is more maintainable and testable.

---

## ⚙️ Setup

1. Clone the repo  
   ```bash
   git clone git@github.com:LegnaRivas/nyt-articles-swiftui.git
   ```

2. Open the project in Xcode  
   ```bash
   open NYTArticles.xcodeproj
   ```

3. Make sure you add your own NYT API Key in:
   ```swift
   NYTAPIService.swift
   ```

   Replace:
   ```swift
   let apiKey = "your_api_key_here"
   ```

4. Run the app on a simulator or device (`Cmd + R`)

---

## 🧪 Testing

- There's a basic test under `NYTArticlesTests/HomeViewModelTests.swift`
- It verifies that the ViewModel loads mock articles successfully

Run all tests using `Cmd + U` in Xcode.

---

## 📌 Notes

- I'm still learning **SwiftUI** and **unit testing**, but I wanted to show clean organization, basic testing, and functional UI.
- If I had more time, I would improve UI polish, add loading skeletons, and test more edge cases.

---

## 📮 Feedback

If you have suggestions or tips for improving the code or structure, I'd love to hear them!

Thanks for checking it out 🙌
