import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_ux_designs/src/common/app/theme/colors.dart';
import 'package:ui_ux_designs/src/common/presentation/widgets/shimmer_widget.dart';

class ShimmerPokemonListTile extends StatelessWidget {
  const ShimmerPokemonListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      baseColor: AppColors.grey150,
      highlightColor: AppColors.grey400,
      isLoading: true,
      child: Container(
        width: 0.15.sh,
        height: 0.15.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: AppColors.grey150,
        ),
      ),
    );
  }
}
