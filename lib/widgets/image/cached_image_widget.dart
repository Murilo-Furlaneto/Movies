import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/constants/my_app_icons.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget(
      {super.key,
      required this.imgUrl,
      this.imgHeight,
      this.imgWidth,
      this.boxFit});

  final String imgUrl;
  final double? imgHeight;
  final double? imgWidth;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return CachedNetworkImage(
      height: imgHeight ?? size.height * 0.3,
      width: imgWidth ?? size.width * 0.2,
      imageUrl: imgUrl,
      fit: boxFit ?? BoxFit.cover,
      errorWidget: (context, url, error) => const Icon(
        MyAppIcons.iconError,
        color: Colors.red,
      ),
    );
  }
}
