import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/doctors/data/model/doctor_model.dart';
import 'package:baby_care/features/doctors/presentation/view/book_doctor_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorCardWidget extends StatelessWidget {
  const DoctorCardWidget({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          BookDoctorView.routeName,
          arguments: doctorModel,
        );
      },
      child: Container(
        padding: 16.all,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 0,
              color: Color(0xff70A97C).withOpacity(0.1),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.bG1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(doctorModel.imageUrl),
                ),
                4.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        doctorModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body2Bold.copyWith(
                          color: AppColors.mText,
                        ),
                      ),
                      4.height,
                      Text(
                        doctorModel.specialty,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.captionRagular.copyWith(
                          color: AppColors.dText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            8.height,
            Row(
              children: [
                Icon(Icons.access_time_sharp),
                4.width,
                Expanded(
                  child: Text(
                    doctorModel.workingHours,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.captionRagular.copyWith(
                      color: AppColors.mText,
                    ),
                  ),
                ),
              ],
            ),
            2.height,
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                4.width,
                Text(
                  '4.8',
                  style: AppTextStyles.btnsRagular.copyWith(
                    color: AppColors.mText,
                  ),
                ),
              ],
            ),
            16.height,
            Row(
              children: [
                WidgetLinearColor(
                  widget: Text(
                    S.of(context).bookAppointment,
                    style: AppTextStyles.body2Bold,
                  ),
                ),
                4.width,
                SvgPicture.asset('assets/svg/arrow.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
