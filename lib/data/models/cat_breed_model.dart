import '../../domain/entities/cat_breed_entity.dart';

class CatBreedModel extends CatBreedEntity {
  CatBreedModel({
    required super.weight,
    required super.id,
    required super.name,
    required super.temperament,
    required super.origin,
    required super.description,
    required super.image,
    required super.lifespan,
    required super.adaptability,
    required super.affectionLevel,
    required super.childFriendly,
    required super.energyLevel,
    required super.intelligence,
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
}
