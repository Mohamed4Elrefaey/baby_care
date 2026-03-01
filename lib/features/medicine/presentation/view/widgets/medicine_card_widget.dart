import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/medicine/data/model/medicine_model.dart';
import 'package:baby_care/features/medicine/presentation/view/medicine_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MedicineCardWidget extends StatelessWidget {
  const MedicineCardWidget({super.key, required this.model});
  final MedicineModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MedicineDetailsView.routeName,
          arguments: model,
        );
      },
      child: Container(
        padding: 16.all,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.25),
              blurRadius: 1,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 91,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(model.imageUrl),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.25),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
            16.height,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    model.name,
                    style: AppTextStyles.body2Bold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                4.width,

                SvgPicture.asset('assets/svg/arrow.svg'),
              ],
            ),
            4.height,
            Text(
              getcategoryText(model.category),
              style: AppTextStyles.body2Ragular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  String getcategoryText(String category) {
    switch (category) {
      case 'antipyretic':
        return 'خافض للحرارة';
      case 'analgesic':
        return 'مسكن';
      case 'antibiotic':
        return 'مضاد حيوي';
      case 'cough':
        return 'للكحة';
      case 'allergy':
        return 'للحساسية';
      case 'digestive':
        return 'جهاز هضمي (مغص/إسهال)';
      case 'vitamins':
        return 'فيتامينات';
      case 'skin':
        return 'جلد';
      default:
        return 'غير معروف';
    }
  }
}
