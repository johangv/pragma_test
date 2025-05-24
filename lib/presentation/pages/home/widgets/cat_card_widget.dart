import 'package:flutter/material.dart';
import 'package:pragma_test/domain/entities/cat_breed_entity.dart';
import 'package:pragma_test/presentation/pages/breedDetails/breed_details_screen.dart';
import 'package:pragma_test/presentation/widgets/image_loader_widget.dart';
import 'package:pragma_test/utils/size_config.dart';

class CatCardWidget extends StatelessWidget {
  const CatCardWidget({super.key, required this.catBreedEntity});

  final CatBreedEntity catBreedEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      BreedDetailsScreen(catBreedEntity: catBreedEntity),
            ),
          ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.w(4),
            vertical: SizeConfig.h(2),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    catBreedEntity.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Touch to view more",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.h(2)),
              ImageLoaderWidget(
                url: catBreedEntity.image,
                loaderMargin: SizeConfig.w(10),
                loaderSize: SizeConfig.w(15),
              ),
              SizedBox(height: SizeConfig.h(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From ${catBreedEntity.origin}",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    "Intelligence of ${catBreedEntity.intelligence.toString()}",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
