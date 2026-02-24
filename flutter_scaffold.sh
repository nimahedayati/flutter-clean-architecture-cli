#!/bin/bash

# Function to initialize the core project structure
init_project() {
    echo "🏗️  Initializing Core Architecture in 'lib/'..."
    
    # Create Core directories
    mkdir -p lib/core/constants
    mkdir -p lib/core/errors
    mkdir -p lib/core/network
    mkdir -p lib/core/theme
    mkdir -p lib/core/utils
    mkdir -p lib/core/widgets
    
    # Create base features directory
    mkdir -p lib/features

    # Create dependency injection file
    touch lib/injection_container.dart
    
    echo "✅ Core architecture initialized successfully!"
}

# Function to generate a new feature structure
create_feature() {
    read -p "Enter the feature name (e.g., authentication, user_profile): " feature_name
    
    # Basic validation to ensure the user typed something
    if [ -z "$feature_name" ]; then
        echo "❌ Error: Feature name cannot be empty."
        return
    fi

    # Convert to lowercase to maintain Dart naming conventions
    feature_name=$(echo "$feature_name" | tr '[:upper:]' '[:lower:]')
    
    BASE_DIR="lib/features/$feature_name"

    if [ -d "$BASE_DIR" ]; then
        echo "⚠️  Feature '$feature_name' already exists!"
        return
    fi

    echo "✨ Generating feature '$feature_name'..."

    # Create Data Layer
    mkdir -p "$BASE_DIR/data/datasources"
    mkdir -p "$BASE_DIR/data/models"
    mkdir -p "$BASE_DIR/data/repositories"

    # Create Domain Layer
    mkdir -p "$BASE_DIR/domain/entities"
    mkdir -p "$BASE_DIR/domain/repositories"
    mkdir -p "$BASE_DIR/domain/usecases"

    # Create Presentation Layer
    mkdir -p "$BASE_DIR/presentation/bloc"
    mkdir -p "$BASE_DIR/presentation/pages"
    mkdir -p "$BASE_DIR/presentation/widgets"

    echo "✅ Feature '$feature_name' generated successfully at $BASE_DIR!"
}

# Main Menu Loop
while true; do
    echo "======================================"
    echo "   Flutter Clean Architecture Tool    "
    echo "======================================"
    echo "1) Initialize Core Architecture"
    echo "2) Generate New Feature"
    echo "3) Exit"
    echo "======================================"
    read -p "Select an option (1-3): " option

    case $option in
        1)
            init_project
            ;;
        2)
            create_feature
            ;;
        3)
            echo "Exiting... Happy coding!"
            exit 0
            ;;
        *)
            echo "❌ Invalid option. Please select 1, 2, or 3."
            ;;
    esac
    echo "" # Print a blank line for readability before the menu repeats
done
