import 'dart:collection';
import 'package:pdmi6/models/pet_model.dart';
import 'package:pdmi6/models/pet_type.dart';

class PetProvider {
  var _index = -1;

  final List<PetModel> _pets = [
    const PetModel('assets/images/Rex.png', 'Rex', 12, 'SRD', PetType.dog),
    const PetModel('assets/images/Fifi.png', 'Fifi', 3, 'Maltes', PetType.dog),
  ];

  void addItem(
    String image,
    String name,
    int years,
    String race,
    PetType type,
  ) {
    _pets.add(
      PetModel(
        image,
        name,
        years,
        race,
        type,
      ),
    );
  }

  int get index => _index;

  set index(int value) {
    if ((value >= 0) && (value < _pets.length)) {
      _index = value;
    } else {
      _index = -1;
    }
  }

  void deleteItem(int index) {
    _pets.removeAt(index);
  }

  UnmodifiableListView<PetModel> get list =>
      UnmodifiableListView<PetModel>(_pets);
}
