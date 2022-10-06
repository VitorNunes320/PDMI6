import 'package:pdmi6/models/pet_type.dart';

class PetModel {
  final String image;
  final String name;
  final int years;
  final String race;
  final PetType type;

  const PetModel(this.image, this.name, this.years, this.race, this.type);
}

class DynamicList {
  List<PetModel> _list = [];
  DynamicList(this._list);

  List get list => _list;
}
