import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/empty_home_app_bar.dart';
import 'package:baby_care/features/children/presentation/cubit/children_cubit.dart';
import 'package:baby_care/features/children/presentation/cubit/children_state.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:baby_care/features/medicine/data/model/medicine_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MedicineDetailsViewBody extends StatelessWidget {
  const MedicineDetailsViewBody({super.key, required this.model});
  final MedicineModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Constants.ktopPadding.height,
            BlocBuilder<ChildrenCubit, ChildrenState>(
              builder: (context, state) {
                if (state is ChildrenLoaded) {
                  return CustomHomeAppBar(child: state.children);
                }
                if (state is ChildrenEmpty) {
                  return EmptyHomeAppBar();
                }
                return SizedBox();
              },
            ),
            Padding(
              padding: Constants.khorizontalPadding.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Constants.ktopPadding.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      Spacer(),
                      Text(
                        model.name.split('(').first.trim(),
                        style: AppTextStyles.headerBold,
                      ),
                      8.width,
                      Text(
                        '(${getFormText(model.form)})',
                        style: AppTextStyles.body1Ragular.copyWith(
                          color: AppColors.dText,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  40.height,
                  Container(
                    width: double.infinity,
                    height: 200,
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
                  24.height,
                  Text(
                    'التصنيف :',
                    style: AppTextStyles.textStyle18.copyWith(
                      color: AppColors.mText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.height,
                  Text(
                    getcategoryText(model.category),
                    style: AppTextStyles.body1Bold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  8.height,
                  Markdown(
                    padding: EdgeInsets.zero,
                    data: model.details,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    styleSheet: MarkdownStyleSheet(
                      p: AppTextStyles.body1Ragular.copyWith(
                        color: AppColors.dText,
                        fontSize: 14,
                      ),
                      h1: AppTextStyles.headerRagular.copyWith(
                        color: AppColors.mText,
                      ),
                      h2: AppTextStyles.headerRagular,
                      strong: AppTextStyles.body2Bold.copyWith(
                        color: AppColors.middleColor,
                        fontSize: 14,
                      ),
                      listBullet: AppTextStyles.captionRagular.copyWith(
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Constants.kbottomPadding.height,
                ],
              ),
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

  String getFormText(String form) {
    switch (form) {
      case 'syrup':
        return 'شراب';
      case 'drops':
        return 'نقط';
      case 'suppository':
        return 'لبوس';
      case 'tablet':
        return 'أقراص';
      case 'sachet':
        return 'فوار / أكياس';
      case 'injection':
        return 'حقن';
      case 'cream':
        return 'كريم / مرهم';
      case 'spray':
        return 'بخاخ';
      case 'other':
        return 'أخرى';
      default:
        return 'غير معروف';
    }
  }
}
