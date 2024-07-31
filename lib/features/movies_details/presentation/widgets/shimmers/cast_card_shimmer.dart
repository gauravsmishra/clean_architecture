import 'package:flutter/material.dart';
import 'package:imdb_poc/core/utils/common_widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCastCard extends StatelessWidget {
  const ShimmerCastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20),
      child: SizedBox(
        height: 130,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
                  width: 90,
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      vSpace(8),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 11,
                              width: 60,
                              color: Colors.grey,
                            ),
                            vSpace(1),
                            Container(
                              height: 8,
                              width: 40,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => hSpace(10),
            itemCount: 20),
      ),
    );
  }
}
