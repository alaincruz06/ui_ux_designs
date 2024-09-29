import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CacheNetworkImageWidgetWithShimmer extends StatelessWidget {
  const CacheNetworkImageWidgetWithShimmer({
    this.withSizedBox,
    required this.urlImage,
    required this.baseColor,
    required this.highlightColor,
    required this.containerHeight,
    required this.containerWidth,
    required this.fit,
    super.key,
  });

  //#region Propiedades

  final bool? withSizedBox;
  final String urlImage;
  final Color baseColor;
  final Color highlightColor;
  final double containerHeight;
  final double containerWidth;
  final BoxFit? fit;

  //#endregion

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: withSizedBox != null && withSizedBox! ? containerHeight : null,
      width: withSizedBox != null && withSizedBox! ? containerWidth : null,
      child: CachedNetworkImage(
        imageUrl: urlImage,
        fit: fit,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            height: containerHeight,
            width: containerWidth,
            color: baseColor,
          ),
        ),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
