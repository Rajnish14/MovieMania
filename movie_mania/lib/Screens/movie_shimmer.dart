import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieShimmer extends StatelessWidget {
  final Widget child;
  final bool enabled;
  const MovieShimmer({Key? key, required this.child, this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.teal.withOpacity(0.1),
      highlightColor: Colors.white,
      child: child,
      enabled: enabled,
    );
  }
}
