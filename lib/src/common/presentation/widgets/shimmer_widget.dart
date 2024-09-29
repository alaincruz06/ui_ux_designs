import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatefulWidget {
  const ShimmerWidget({
    super.key,
    required this.child,
    required this.baseColor,
    required this.highlightColor,
    required this.isLoading,
  });

  final Widget child;
  final bool isLoading;
  final Color baseColor;
  final Color highlightColor;

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: widget.baseColor,
      highlightColor: widget.highlightColor,
      enabled: widget.isLoading,
      child: widget.child,
    );
  }
}
