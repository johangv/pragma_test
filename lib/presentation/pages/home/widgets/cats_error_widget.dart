import 'package:flutter/material.dart';
import 'package:pragma_test/utils/size_config.dart';

class CatsErrorWidget extends StatelessWidget {
  const CatsErrorWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: SizeConfig.h(5)),
        Image.asset("assets/images/confused_cat.jpg"),
      ],
    );
  }
}
