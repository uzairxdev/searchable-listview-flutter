#   Searchable Listview using provider

This Flutter application displays a list of users with functionalities to search, follow/unfollow, and swipe actions. The app uses the Provider package for state management.

## Features

- **User List Display**: Shows a list of users with their names, usernames, and profile pictures.
- **Search Functionality**: Filter users by name using a search bar.
- **Follow/Unfollow Users**: Follow or unfollow users by tapping a button.
- **Swipe Actions**: Swipe left or right on a user to reveal additional actions like Archive, Share, More, and Delete.

## Screenshots

![User List](screenshots/user_list.png)
![Search](screenshots/search.png)
![Follow](screenshots/follow.png)

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- An IDE such as [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/uzairxdev/searchable-listview-flutter.git
    cd searchable listview flutter
    ```

2. **Install dependencies**:
    ```sh
    flutter pub get
    ```

3. **Run the app**:
    ```sh
    flutter run
    ```

## Project Structure

```plaintext
lib
├── main.dart
├── models
│   └── user.dart
├── providers
│   └── user_provider.dart
├── screens
│   └── home_page.dart
└── widgets
    └── user_list_item.dart
