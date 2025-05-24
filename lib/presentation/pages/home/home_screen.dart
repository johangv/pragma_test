import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_test/application/cubits/catBreed/cat_breed_cubit.dart';
import 'package:pragma_test/application/manager/dependencies.dart';
import 'package:pragma_test/presentation/pages/home/widgets/cats_list_widget.dart';
import 'package:pragma_test/presentation/pages/home/widgets/searcher_widget.dart';
import 'package:pragma_test/utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catbreeds", textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) => getIt<CatBreedCubit>(),
        child: Container(
          margin: EdgeInsets.all(SizeConfig.h(2)),
          child: Column(
            children: [
              SearcherWidget(),
              SizedBox(height: SizeConfig.h(2)),
              Expanded(child: CatsListWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
