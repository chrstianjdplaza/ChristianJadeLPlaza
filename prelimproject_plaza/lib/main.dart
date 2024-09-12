import 'package:riverpod/riverpod.dart';  // Correct Riverpod package for Dart
import 'models/name.dart';
import 'services/name_service.dart';
import 'dart:io'; // For handling user input/output

// This Provider creates and provides an instance of NameService
final nameServiceProvider = Provider((ref) => NameService());

void main() {
  final container = ProviderContainer();
  final nameService = container.read(nameServiceProvider);

  print("Welcome to the Name List App!");

  while (true) {
    print("\nChoose an option:");
    print("1. Add Name");
    print("2. View Names");
    print("3. Delete Name");
    print("4. Exit");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // Add Name
        print("Enter the name:");
        String? nameTitle = stdin.readLineSync();
        if (nameTitle != null && nameTitle.isNotEmpty) {
          nameService.addName(nameTitle);
          print("Name added!");
        } else {
          print("Invalid name.");
        }
        break;

      case '2':
        // View Names
        List<Name> names = nameService.getNames();
        if (names.isEmpty) {
          print("No names available.");
        } else {
          print("\nYour names:");
          for (int i = 0; i < names.length; i++) {
            print("${i + 1}. ${names[i].title}");
          }
        }
        break;

      case '3':
        // Delete Name
        print("Enter the number of the name to delete:");
        String? nameNumber = stdin.readLineSync();
        if (nameNumber != null && int.tryParse(nameNumber) != null) {
          int nameIndex = int.parse(nameNumber) - 1;
          if (nameIndex >= 0 && nameIndex < nameService.getNames().length) {
            nameService.deleteName(nameIndex);
            print("Name deleted!");
          } else {
            print("Invalid name number.");
          }
        } else {
          print("Please enter a valid number.");
        }
        break;

      case '4':
        // Exit
        print("Done!");
        exit(0);

      default:
        print("Invalid choice. Please try again.");
        break;
    }
  }
}
