import '../models/name.dart';

class NameService {
  final List<Name> _names = [];

  // Method to add a name
  void addName(String title) {
    _names.add(Name(title));
  }

  // Method to get the list of names
  List<Name> getNames() {
    return _names;
  }

  // Method to delete a name
  void deleteName(int index) {
    _names.removeAt(index);
  }
}
