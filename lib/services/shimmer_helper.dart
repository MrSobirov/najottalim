import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHelper {
  static Color shimmerBaseColor = Colors.grey.shade300;
  static Color shimmerHighlightColor = Colors.grey.shade100;
  static const Color onPrimary = Color.fromRGBO(32, 155, 204, 1);

  buildBasicShimmer({double? height, double? width, double? radius}) {
    height = height ?? 100.h;
    width = width ?? 375.w;
    radius = radius ?? 0;
    return Shimmer.fromColors(
      baseColor: ShimmerHelper.shimmerBaseColor,
      highlightColor: ShimmerHelper.shimmerHighlightColor,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: ShimmerHelper.onPrimary,
        ),
      ),
    );
  }

  buildListShimmer(item_count, item_height, item_width, {Axis direction = Axis.vertical, double radius = 0, double paddingValue = 0}) {
    return ListView.builder(
      itemCount: item_count,
      scrollDirection: direction,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: false,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: direction == Axis.vertical ? 0 : paddingValue.w, vertical: direction == Axis.vertical ? paddingValue.h : 0),
          child: ShimmerHelper().buildBasicShimmer(height: item_height, width: item_width, radius: radius),
        );
      },
    );
  }
}