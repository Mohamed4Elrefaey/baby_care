import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/helper_functions/days_between_from_today.dart';
import 'package:baby_care/core/helper_functions/format_arabic_date.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';
import 'package:baby_care/features/vaccination/presentation/view/widgets/view_details_button.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VaccinationCardUpcoming extends StatelessWidget {
  const VaccinationCardUpcoming({super.key, required this.vaccineRecordModel});
  final VaccineRecordModel vaccineRecordModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 1.9,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bG1, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                vaccineRecordModel.vaccine.name,
                style: AppTextStyles.textStyle15,
              ),
              Spacer(),
              InkWell(
                onTap: () => showDialog(
                  context: context,

                  builder: (context) => AlertDialog(
                    title: Text(
                      vaccineRecordModel.vaccine.name,
                      style: AppTextStyles.headerBold,
                    ),
                    content: Text(
                      vaccineRecordModel.vaccine.description ?? '',
                      style: AppTextStyles.body1Ragular,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(S.of(context).cancel),
                      ),
                    ],
                  ),
                ),
                child: Icon(Icons.info_outline, color: AppColors.dText),
              ),
            ],
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            color: Colors.yellow.withOpacity(0.45),
            child: Text(
              '${S.of(context).timeAfter} ${daysBetweenFromToday(vaccineRecordModel.dueDate)} ${S.of(context).unitDays}',
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
                        insetPadding: EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: 370,

                          padding: EdgeInsets.all(16),
                          child: Column(
                            spacing: 8,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                S.of(context).reminderActivated,
                                style: AppTextStyles.headerBold,
                              ),
                              SvgPicture.asset(
                                'assets/svg/check-verified.svg',
                                height: 90,
                              ),

                              Text(
                                S.of(context).reminderActivatedMessage,
                                style: AppTextStyles.body1Ragular,
                              ),
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
              Expanded(child: ViewDetailsButton(onTap: () {})),
            ],
          ),
        ],
      ),
    );
  }
}
