# GitHub Contributions

GitHub Contributions is a small program that fetches your contributions from the GitHub contribution page `https://github.com/users/<username>/contributions` and displays them in various ways. The app is currently in development and will support:

- A main app window
- A notification center widget
- A menu bar icon

I am working on the macOS app and have planned to add an iOS app.

This project is part of my new years resolution to work on my coding projects. I am measuring it with GitHub contributions. So I was looking for an app to track the progress. I forked [Remi Roberts project](https://github.com/remirobert/Github-contributions) and started working on it. But I felt that the code base makes a lot of smaller mistakes (like parsing HTML with a RegEx), is overall not really clean and also was written two years ago for an older Swift version. So I created my own project from scratch to alleviate this problem.