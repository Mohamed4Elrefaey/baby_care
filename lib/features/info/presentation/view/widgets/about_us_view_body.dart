import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_appbar.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AboutUsViewBody extends StatelessWidget {
  const AboutUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: Constants.khorizontalPadding.horizontal,
          child: Column(
            children: [
              Constants.ktopPadding.height,
              CustomAppBar(
                title: S.of(context).aboutUs,
                onBack: () {
                  Navigator.pop(context);
                },
              ),
              40.height,
              Container(
                width: double.infinity,
                padding: 16.all,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.bG1, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],

                  color: AppColors.gray4,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Markdown(
                  data: S.of(context).aboutUsText,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  styleSheet: MarkdownStyleSheet(
                    p: AppTextStyles.captionRagular.copyWith(
                      color: AppColors.dText,
                      fontSize: 14,
                    ),
                    h1: AppTextStyles.headerRagular.copyWith(
                      color: AppColors.middleColor,
                    ),
                    h2: AppTextStyles.headerRagular.copyWith(
                      color: AppColors.middleColor,
                    ),
                    strong: AppTextStyles.body2Bold.copyWith(
                      color: AppColors.middleColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Constants.kbottomPadding.height,
            ],
          ),
        ),
      ),
    );
  }
}
