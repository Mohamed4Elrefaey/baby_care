import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommunityCareWidget extends StatelessWidget {
  const CommunityCareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        margin: EdgeInsets.only(
          left: Localizations.localeOf(context).languageCode == 'ar' ? 0 : 16,
          right: Localizations.localeOf(context).languageCode == 'ar' ? 8 : 16,
        ),
        padding: 16.all,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.bG,
          border: Border.all(color: AppColors.bG1),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.04),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.04),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              spacing: 8,
              children: [
                SvgPicture.asset('assets/svg/avatars.svg'),
                Text('مريم علي', style: AppTextStyles.body1Bold),
                Text(
                  '.   منذ ٦ أشهر',
                  style: AppTextStyles.captionRagular.copyWith(
                    color: Color(0xff8C8C8C),
                  ),
                ),
              ],
            ),
            16.height,
            Text(
              'الاستيقاظ الليلي يزداد سوءًا في عمر ٩ أشهر - هل هذا طبيعي؟',
              style: AppTextStyles.body2Bold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            8.height,
            Text(
              'كانت ابنتي تنام طوال الليل من عمر ٦-٨ أشهر، ولكن الآن في عمر ٩ أشهر تستيقظ ٣-٤ مرات كل ليلة. هل واجه أحد منكم هذا التراجع؟ أبحث عن نصيحة',
              style: AppTextStyles.captionRagular.copyWith(
                color: Color(0xff8C8C8C),
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.thumb_up,
                        size: 20,
                        color: Color(0xff8C8C8C),
                      ),
                    ),
                    4.width,
                    Text(
                      '٢٣',
                      style: AppTextStyles.captionRagular.copyWith(
                        color: Color(0xff8C8C8C),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.comment,
                        size: 20,
                        color: Color(0xff8C8C8C),
                      ),
                    ),
                    4.width,
                    Text(
                      '١٠',
                      style: AppTextStyles.captionRagular.copyWith(
                        color: Color(0xff8C8C8C),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.remove_red_eye,
                        size: 20,
                        color: Color(0xff8C8C8C),
                      ),
                    ),
                    4.width,
                    Text(
                      '١٠',
                      style: AppTextStyles.captionRagular.copyWith(
                        color: Color(0xff8C8C8C),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.bookmark,
                    size: 20,
                    color: Color(0xff8C8C8C),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.share, size: 20, color: Color(0xff8C8C8C)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
