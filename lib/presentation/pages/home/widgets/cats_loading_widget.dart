import 'package:flutter/material.dart';
import 'package:pragma_test/utils/size_config.dart';

class CatsLoadingWidget extends StatelessWidget {
  const CatsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: SizeConfig.w(40),
        width: SizeConfig.w(40),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
