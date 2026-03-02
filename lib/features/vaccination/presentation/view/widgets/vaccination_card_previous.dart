import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/helper_functions/format_arabic_date.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VaccinationCardPrevious extends StatelessWidget {
  const VaccinationCardPrevious({super.key, required this.vaccineRecordModel});
  final VaccineRecordModel vaccineRecordModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bG1, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
        color: AppColors.gray4,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vaccineRecordModel.vaccineName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.textStyle15,
                ),
                8.height,
                Row(
                  children: [
                    Text(
                      S.of(context).vaccinationDate,
                      style: AppTextStyles.body2Ragular.copyWith(
                        color: AppColors.dText,
                      ),
                    ),
                    4.width,
                    Text(
                      formatArabicDate(
                        vaccineRecordModel.dueDate.toIso8601String(),
                        context,
                      ),

                      style: AppTextStyles.body2Ragular,
                    ),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).viewDetails,
                      style: AppTextStyles.btnsRagular.copyWith(
                        color: vaccineRecordModel.status == 'completed'
                            ? AppColors.primary
                            : AppColors.danger,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_outward_sharp,
                      color: vaccineRecordModel.status == 'completed'
                          ? AppColors.primary
                          : AppColors.danger,
                      weight: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            children: [
              SvgPicture.asset(
                vaccineRecordModel.status == 'completed'
                    ? 'assets/svg/check-verified.svg'
                    : 'assets/svg/x-circle.svg',
              ),
              8.height,
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: vaccineRecordModel.status == 'completed'
                      ? AppColors.primary
                      : AppColors.danger,
                ),
                child: Text(
                  vaccineRecordModel.status == 'completed'
                      ? S.of(context).statusVaccinated
                      : S.of(context).statusNotVaccinated,
                  style: AppTextStyles.captionRagular.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
