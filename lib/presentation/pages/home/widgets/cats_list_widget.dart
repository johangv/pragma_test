import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_test/application/cubits/catBreed/cat_breed_cubit.dart';
import 'package:pragma_test/application/cubits/catBreed/cat_breed_state.dart';
import 'package:pragma_test/presentation/pages/home/widgets/cat_card_widget.dart';
import 'package:pragma_test/presentation/pages/home/widgets/cats_error_widget.dart';
import 'package:pragma_test/presentation/pages/home/widgets/cats_loading_widget.dart';
import 'package:pragma_test/utils/size_config.dart';

class CatsListWidget extends StatefulWidget {
  const CatsListWidget({super.key});

  @override
  State<CatsListWidget> createState() => _CatsListWidgetState();
}

class _CatsListWidgetState extends State<CatsListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // Get initial elements
    context.read<CatBreedCubit>().getInitialCats();

    //Enable Lazy Loading on Scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 300 &&
          context.read<CatBreedCubit>().state is CatsLoaded &&
          !(context.read<CatBreedCubit>().state as CatsLoaded).hasReachedEnd) {
        context.read<CatBreedCubit>().getMoreCats();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBreedCubit, CatBreedState>(
      builder: (context, state) {
        if (state is CatBreedLoading || state is CatBreedInitial) {
          return CatsLoadingWidget();
        } else if (state is CatsLoaded) {
          if (state.cats.isNotEmpty) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.cats.length,
              itemBuilder: (context, index) {
                if (index >= state.cats.length) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.w(4)),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                final cat = state.cats[index];
                return CatCardWidget(catBreedEntity: cat);
              },
            );
          } else {
            return CatsErrorWidget(
              message:
                  "Ups! We Can't find any cat breed with this name. Try again with other name.",
            );
          }
        } else if (state is CatBreedError) {
          return CatsErrorWidget(message: state.message);
        } else {
          return CatsErrorWidget(
            message: "Ups! An unexpected problem ocurred, please try again",
          );
        }
      },
    );
  }
}
