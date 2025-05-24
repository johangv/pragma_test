import 'package:pragma_test/domain/entities/cat_breed_entity.dart';

class TestElements {
  static List<CatBreedEntity> breedCatsList = [
    CatBreedEntity(
      weight: "3 - 5",
      id: "abys",
      name: "Abyssinian",
      temperament: "Active, Energetic, Independent, Intelligent, Gentle",
      origin: "Egypt",
      description:
          "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
      lifespan: "14 - 15",
      adaptability: 5,
      affectionLevel: 5,
      childFriendly: 3,
      energyLevel: 5,
      intelligence: 3,
    ),
    CatBreedEntity(
      weight: "3 - 5",
      id: "aege",
      name: "Aegean",
      temperament: "Affectionate, Social, Intelligent, Playful, Active",
      origin: "Greece",
      description:
          "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.",
      lifespan: "9 - 12",
      adaptability: 5,
      affectionLevel: 4,
      childFriendly: 4,
      energyLevel: 3,
      intelligence: 3,
    ),
    CatBreedEntity(
      weight: "3 - 7",
      id: "abob",
      name: "American Bobtail",
      temperament: "Intelligent, Interactive, Lively, Playful, Sensitive",
      origin: "United States",
      description:
          "American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.",
      lifespan: "11 - 15",
      adaptability: 5,
      affectionLevel: 5,
      childFriendly: 4,
      energyLevel: 3,
      intelligence: 5,
    ),
  ];

  static String breedCatsJson = '''
        [
          {
            "weight": {
              "imperial": "7  -  10",
              "metric": "3 - 5"
            },
            "id": "abys",
            "name": "Abyssinian",
            "temperament": "Active, Energetic, Independent, Intelligent, Gentle",
            "origin": "Egypt",
            "description":
                "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
            "life_span": "14 - 15",
            "adaptability": 5,
            "affection_level": 5,
            "child_friendly": 3,
            "energy_level": 5,
            "intelligence": 3
          },
          {
            "weight": {
              "imperial": "7 - 10",
              "metric": "3 - 5"
            },
            "id": "aege",
            "name": "Aegean",
            "temperament": "Affectionate, Social, Intelligent, Playful, Active",
            "origin": "Greece",
            "description":
                "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.",
            "life_span": "9 - 12",
            "adaptability": 5,
            "affection_level": 4,
            "child_friendly": 4,
            "energy_level": 3,
            "intelligence": 3,
            "image": {
              "id": "ozEvzdVM-",
              "width": 1200,
              "height": 800,
              "url": "https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg"
            }
          }
        ]
      ''';
}
