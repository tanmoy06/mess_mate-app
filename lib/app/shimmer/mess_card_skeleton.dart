import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mess_mate/app/service/responsive_ui_service.dart';

class MessCardSkeleton extends StatelessWidget {
  const MessCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.kh,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140.kh,
                width: 100.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16.kh,
                      width: 140.kw,
                      color: Colors.white,
                    ),
                    8.kheightBox,
                    Container(
                      height: 12.kh,
                      width: 100.kw,
                      color: Colors.white,
                    ),
                    8.kheightBox,
                    Row(
                      children: List.generate(
                        3,
                        (_) => Container(
                          height: 24.kh,
                          width: 50.kw,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    12.kheightBox,
                    Container(height: 14.kh, width: 60.kw, color: Colors.white),
                    4.kheightBox,
                    Container(height: 12.kh, width: 50.kw, color: Colors.white),
                    12.kheightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 44.kh,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        8.kwidthBox,
                        Expanded(
                          child: Container(
                            height: 44.kh,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
