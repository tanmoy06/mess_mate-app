import 'package:flutter/material.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedPropertySkeleton extends StatelessWidget {
  const FeaturedPropertySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140.kh,
            width: 160.kw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          5.kheightBox,
          Container(height: 15.kh, width: 100.kw, color: Colors.white),
          5.kheightBox,
          Container(
            height: 20.kh,
            width: 50.kw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
          5.kheightBox,
          Container(height: 12.kh, width: 80.kw, color: Colors.white),
        ],
      ),
    );
  }
}
