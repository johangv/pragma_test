import 'package:flutter/material.dart';

class ImageLoaderWidget extends StatelessWidget {
  const ImageLoaderWidget({
    super.key,
    required this.url,
    required this.loaderSize,
    required this.loaderMargin,
  });

  final String? url;
  final double loaderSize;
  final double loaderMargin;

  final String noImage =
      "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: precacheImage(NetworkImage(url ?? noImage), context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              height: loaderSize,
              width: loaderSize,
              margin: EdgeInsets.all(loaderMargin),
              child: const CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Image.network(noImage);
        } else {
          return Image.network(url ?? noImage);
        }
      },
    );
  }
}
