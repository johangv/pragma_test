import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_test/application/cubits/catBreed/cat_breed_cubit.dart';

class SearcherWidget extends StatefulWidget {
  const SearcherWidget({super.key});

  @override
  State<SearcherWidget> createState() => _SearcherWidgetState();
}

class _SearcherWidgetState extends State<SearcherWidget> {
  final TextEditingController _searcherController = TextEditingController();

  @override
  void dispose() {
    _searcherController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    setState(() {
      _searcherController.clear();
      context.read<CatBreedCubit>().getInitialCats();
    });
  }

  void _initSearch(String value) {
    if (value.length == 1) setState(() {});

    context.read<CatBreedCubit>().searchCats(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => _initSearch(value),
      controller: _searcherController,
      decoration: InputDecoration(
        hintText: 'Search by breed name',
        suffixIcon:
            !_searcherController.text.isNotEmpty
                ? Icon(Icons.search)
                : IconButton(
                  onPressed: () => _clearSearch(),
                  icon: Icon(Icons.close),
                ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
