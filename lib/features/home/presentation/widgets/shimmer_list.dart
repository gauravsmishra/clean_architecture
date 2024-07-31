import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/common_widgets.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.secondaryContainer,
      highlightColor: Theme.of(context).disabledColor,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(width: 15.0),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 190,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Theme.of(context).disabledColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    vSpace(10),
                    Container(
                      width: 120,
                      height: 18,
                      color: Theme.of(context).disabledColor,
                    ),
                    vSpace(8),
                    Container(
                      width: 80,
                      height: 15,
                      color: Theme.of(context).disabledColor,
                    ),
                    vSpace(8),
                    Container(
                        width: 100,
                        height: 15,
                        color: Theme.of(context).disabledColor),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
