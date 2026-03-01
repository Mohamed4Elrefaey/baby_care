import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/helper_functions/days_between_from_today.dart';
import 'package:baby_care/core/helper_functions/format_arabic_date.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';
import 'package:baby_care/generated/l10n.g.dart'; // or wherever S is
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VaccinationCard extends StatelessWidget {
  const VaccinationCard({super.key, required this.vaccineRecord});
  final VaccineRecordModel vaccineRecord;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.gray4,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.bG1, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vaccineRecord.vaccine.name,
              style: AppTextStyles.textStyle15,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      vaccineRecord.dueDate != null
                          ? formatArabicDate(
                              vaccineRecord.dueDate!.toIso8601String(),
                              context,
                            )
                          : '—',
                      style: AppTextStyles.body2Ragular,
                    ),
                  ),
                ),
              ],
            ),
            8.height,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              color: Colors.yellow.withOpacity(0.45),
              child: Text(
                '${S.of(context).timeAfter} ${vaccineRecord.dueDate != null ? daysBetweenFromToday(vaccineRecord.dueDate!) : '—'} ${S.of(context).unitDays}',
                style: AppTextStyles.captionRagular,
              ),
            ),
            16.height,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: S.of(context).remindMe,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 370,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  S.of(context).reminderActivated,
                                  style: AppTextStyles.headerBold,
                                ),
                                const SizedBox(height: 8),
                                SvgPicture.asset(
                                  'assets/svg/check-verified.svg',
                                  height: 90,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  S.of(context).reminderActivatedMessage,
                                  style: AppTextStyles.body1Ragular,
                                ),
                                const SizedBox(height: 8),
                                CustomButton(
                                  title: S.of(context).ok,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                8.width,
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 46.h,
                      decoration: BoxDecoration(
                        color: AppColors.bG,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.primary, width: 1),
                      ),
                      child: Center(
                        child: WidgetLinearColor(
                          widget: Text(
                            S.of(context).view,
                            style: AppTextStyles.btnsRagular,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
