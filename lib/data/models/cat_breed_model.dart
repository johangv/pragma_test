import 'package:pragma_test/domain/entities/cat_breed_entity.dart';

class CatBreedModel {
  final String weight;
  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;
  final String? image;
  final String lifespan;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int energyLevel;
  final int intelligence;

  CatBreedModel({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.energyLevel,
    required this.intelligence,
    required this.lifespan,
    this.image,
  });

  factory CatBreedModel.fromJson(Map<String, dynamic> json) {
    return CatBreedModel(
      weight: json['weight']['metric'],
      id: json['id'],
      name: json['name'],
      temperament: json['temperament'],
      origin: json['origin'],
      description: json['description'],
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      energyLevel: json['energy_level'],
      intelligence: json['intelligence'],
      lifespan: json['life_span'],
      image: json['image'] != null ? json['image']['url'] : null,
    );
  }

  CatBreedEntity toEntity() {
    return CatBreedEntity(
      weight: weight,
      id: id,
      name: name,
      temperament: temperament,
      origin: origin,
      description: description,
      image: image,
      lifespan: lifespan,
      adaptability: adaptability,
      affectionLevel: affectionLevel,
      childFriendly: childFriendly,
      energyLevel: energyLevel,
      intelligence: intelligence,
    );
  }
}
