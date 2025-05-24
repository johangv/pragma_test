import 'package:flutter/material.dart';
import 'package:pragma_test/domain/entities/cat_breed_entity.dart';
import 'package:pragma_test/presentation/pages/breedDetails/widgets/breed_characteristic_widget.dart';
import 'package:pragma_test/presentation/widgets/image_loader_widget.dart';
import 'package:pragma_test/utils/size_config.dart';

class BreedDetailsScreen extends StatelessWidget {
  const BreedDetailsScreen({super.key, required this.catBreedEntity});

  final CatBreedEntity catBreedEntity;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> breedCharacteristics = [
      {"Origin Country": catBreedEntity.origin},
      {"Intelligence": catBreedEntity.intelligence.toString()},
      {"Adaptability": catBreedEntity.adaptability.toString()},
      {"Life Span": "${catBreedEntity.lifespan} years"},
    ];

    return Scaffold(
      appBar: AppBar(title: Text(catBreedEntity.name), centerTitle: true),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: SizeConfig.h(60)),
            child: ImageLoaderWidget(
              url: catBreedEntity.image,
              loaderSize: SizeConfig.h(5),
              loaderMargin: SizeConfig.h(4),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(SizeConfig.w(4)),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(bottom: SizeConfig.h(2.3)),
                      child: Text(
                        "Description of this breed",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(bottom: SizeConfig.h(2.3)),
                      child: Text(
                        catBreedEntity.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(bottom: SizeConfig.h(2.3)),
                        child: Text(
                          "Other Characteristics",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 3,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final entry =
                            breedCharacteristics
                                .expand((e) => e.entries)
                                .toList()[index];
                        return BreedCharacteristicWidget(
                          title: entry.key,
                          content: entry.value,
                        );
                      },
                      childCount:
                          breedCharacteristics.expand((e) => e.entries).length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
