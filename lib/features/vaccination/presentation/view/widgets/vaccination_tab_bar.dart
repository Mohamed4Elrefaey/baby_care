import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';

class VaccinationTabBar extends StatelessWidget {
  const VaccinationTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.graphic),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TabBar(
        controller: tabController,

        dividerColor: Colors.transparent,

        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xffFBFDFF),
          border: Border.all(color: AppColors.graphic),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              color: Color(0xff0A0D12).withOpacity(0.05),
            ),
          ],
        ),
        labelColor: Color(0xFF68A394),

        labelPadding: EdgeInsets.all(10),
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: AppTextStyles.textStyle18.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: AppTextStyles.textStyle18,
        tabs: [
          Tab(text: S.of(context).upcoming),
          Tab(text: S.of(context).previous),
        ],
      ),
    );
  }
}
