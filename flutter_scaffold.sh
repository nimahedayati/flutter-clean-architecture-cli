#!/bin/bash

# Function to initialize the core project structure
init_project() {
    echo "🏗️  Initializing Core Architecture in 'lib/'..."
    
    mkdir -p lib/core/constants
    mkdir -p lib/core/errors
    mkdir -p lib/core/network
    mkdir -p lib/core/theme
    mkdir -p lib/core/utils
    mkdir -p lib/core/widgets
    mkdir -p lib/features
    touch lib/injection_container.dart
    
    echo "✅ Core architecture initialized successfully!"
}

# Function to generate a new feature structure
create_feature() {
    read -p "Enter the feature name (e.g., authentication, user_profile): " feature_name
    
    if [ -z "$feature_name" ]; then
        echo "❌ Error: Feature name cannot be empty."
        return
    fi

    feature_name=$(echo "$feature_name" | tr '[:upper:]' '[:lower:]')
    BASE_DIR="lib/features/$feature_name"

    if [ -d "$BASE_DIR" ]; then
        echo "⚠️  Feature '$feature_name' already exists!"
        return
    fi

    echo "✨ Generating feature folders for '$feature_name'..."

    # Create directories
    mkdir -p "$BASE_DIR/data/datasources"
    mkdir -p "$BASE_DIR/data/models"
    mkdir -p "$BASE_DIR/data/repositories"
    mkdir -p "$BASE_DIR/domain/entities"
    mkdir -p "$BASE_DIR/domain/repositories"
    mkdir -p "$BASE_DIR/domain/usecases"
    mkdir -p "$BASE_DIR/presentation/bloc"
    mkdir -p "$BASE_DIR/presentation/pages"
    mkdir -p "$BASE_DIR/presentation/widgets"

    # Ask user if they want boilerplate files
    read -p "Do you want to generate example boilerplate files for this feature? (y/n): " gen_files

    if [[ "$gen_files" == "y" || "$gen_files" == "Y" ]]; then
        echo "📄 Generating Dart files..."

        # Convert snake_case to PascalCase for Dart class names
        class_name=$(echo "$feature_name" | awk -F_ '{for(i=1;i<=NF;i++) printf "%s", toupper(substr($i,1,1)) substr($i,2)} END {print ""}')

        # 1. Domain Layer: Entity
        cat <<EOF > "$BASE_DIR/domain/entities/${feature_name}.dart"
class ${class_name}Entity {
  const ${class_name}Entity();
}
EOF

        # 2. Domain Layer: Repository Interface
        cat <<EOF > "$BASE_DIR/domain/repositories/${feature_name}_repository.dart"
import '../entities/${feature_name}.dart';

abstract class ${class_name}Repository {
  // Future<${class_name}Entity> get${class_name}();
}
EOF

        # 3. Data Layer: Model
        cat <<EOF > "$BASE_DIR/data/models/${feature_name}_model.dart"
import '../../domain/entities/${feature_name}.dart';

class ${class_name}Model extends ${class_name}Entity {
  const ${class_name}Model();

  factory ${class_name}Model.fromJson(Map<String, dynamic> json) {
    return const ${class_name}Model();
  }
}
EOF

        # 4. Data Layer: Repository Implementation
        cat <<EOF > "$BASE_DIR/data/repositories/${feature_name}_repository_impl.dart"
import '../../domain/repositories/${feature_name}_repository.dart';

class ${class_name}RepositoryImpl implements ${class_name}Repository {
  ${class_name}RepositoryImpl();
}
EOF

        # 5. Presentation Layer: Page
        cat <<EOF > "$BASE_DIR/presentation/pages/${feature_name}_page.dart"
import 'package:flutter/material.dart';

class ${class_name}Page extends StatelessWidget {
  const ${class_name}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${class_name}'),
      ),
      body: const Center(
        child: Text('Welcome to ${class_name} Page'),
      ),
    );
  }
}
EOF
        echo "✅ Boilerplate files created!"
    else
        echo "✅ Folders created without files."
    fi
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
    echo ""
done
