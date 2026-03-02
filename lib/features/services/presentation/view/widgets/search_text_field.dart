import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: AppColors.bG, width: 1),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 2,
            color: const Color(0xff0A0D12).withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/search.svg'),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ابحث هنا',
                hintStyle: AppTextStyles.body1Ragular.copyWith(
                  color: AppColors.dText,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchDoctorTextField extends StatelessWidget {
  const SearchDoctorTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: AppColors.bG, width: 1),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              color: const Color(0xff0A0D12).withOpacity(0.05),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/svg/search.svg'),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: S.of(context).findNearestDoctor,
                  hintStyle: AppTextStyles.body1Ragular.copyWith(
                    color: AppColors.dText,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
