# Flutter Clean Architecture Scaffold 🏗️

A simple, interactive bash script to automate the boilerplate of setting up a Clean Architecture and feature-first folder structure in your Flutter projects. Stop creating folders manually and start coding faster!

## ✨ Features

* **Initialize Core Architecture:** Instantly creates the `core/` directory with standard subfolders (constants, errors, network, theme, utils, widgets) and a dependency injection entry point.
* **Generate New Features:** Prompts you for a feature name and generates a complete, isolated Clean Architecture module (`data`, `domain`, and `presentation` layers) in seconds.
* **Dart Naming Conventions:** Automatically formats your feature names to standard `snake_case`.

## 🚀 Getting Started

To use this script, simply download or copy the `flutter_scaffold.sh` file into the root directory of your Flutter project (where your `pubspec.yaml` lives).

### Mac & Linux

1. Make the script executable:
```bash
   chmod +x flutter_scaffold.sh

```

2. Run the interactive script:
```bash
./flutter_scaffold.sh

```



### Windows

Windows does not natively run `.sh` files, but you can easily run this using **Git Bash** (which is installed alongside Git).

1. Open your project folder in standard Windows File Explorer.
2. Right-click in the empty space and select **"Open Git Bash here"** (On Windows 11, click "Show more options" first).
3. In the terminal that opens, run:
```bash
sh flutter_scaffold.sh

```



## 📂 What it generates

### 1. Core Architecture

When you select "Initialize Core Architecture", it builds:

```text
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── theme/
│   ├── utils/
│   └── widgets/
├── features/
└── injection_container.dart

```

### 2. Feature Structure

When you select "Generate New Feature" and enter a name (e.g., `authentication`), it builds:

```text
lib/
└── features/
    └── authentication/
        ├── data/
        │   ├── datasources/
        │   ├── models/
        │   └── repositories/
        ├── domain/
        │   ├── entities/
        │   ├── repositories/
        │   └── usecases/
        └── presentation/
            ├── bloc/
            ├── pages/
            └── widgets/

```

## 🤝 Contributing

Feel free to fork this repository, submit pull requests, or open issues if you want to suggest improvements (like automatically generating base Dart files)!
