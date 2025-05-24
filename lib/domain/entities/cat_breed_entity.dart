class CatBreedEntity {
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

  CatBreedEntity({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    this.image,
    required this.lifespan,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.energyLevel,
    required this.intelligence,
  });
}
