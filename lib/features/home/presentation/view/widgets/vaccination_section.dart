import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_container.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_dots_indicator.dart';
import 'package:baby_care/features/home/presentation/view/widgets/vaccination_page_view.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';
import 'package:baby_care/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:baby_care/features/vaccination/presentation/cubit/vaccination_state.dart';
import 'package:baby_care/features/vaccination/presentation/view/vaccination_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class VaccinationSection extends StatelessWidget {
  const VaccinationSection({
    super.key,
    required this.currentIndex,
    required this.controller,
    required this.onPageChanged,
  });
  final int currentIndex;
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: Constants.khorizontalPadding.horizontal,
          child: Row(
            children: [
              Text(
                S.of(context).nextVaccination,
                style: AppTextStyles.headerBold,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, VaccinationView.routeName);
                },
                child: WidgetLinearColor(
                  widget: Text(
                    S.of(context).viewAll,
                    style: AppTextStyles.body1Bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        16.height,
        BlocBuilder<VaccinationCubit, VaccinationState>(
          builder: (context, state) {
            if (state is VaccinationLoaded) {
              if (state.vaccinationData[0].isEmpty) {
                return SizedBox(
                  height: 210,
                  child: Padding(
                    padding: 16.horizontal,
                    child: CustomContainer(
                      child: Center(
                        child: Text(
                          'لا توجد تطعيمات قادمة',
                          style: AppTextStyles.body2Ragular.copyWith(
                            color: AppColors.dText,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  VaccinationPageView(
                    vaccineRecords:
                        state.vaccinationData[0] as List<VaccineRecordModel>,
                    controller: controller,
                    onPageChanged: onPageChanged,
                  ),

                  10.height,

                  CustomDotsIndicator(
                    currentIndex: currentIndex,
                    totalDots: state.vaccinationData[0].length > 3
                        ? 3
                        : state.vaccinationData[0].length,
                  ),
                ],
              );
            }
            if (state is VaccinationLoading) {
              return SizedBox(
                height: 210,
                child: PageView.builder(
                  padEnds: false,
                  controller: controller,
                  itemCount: 3,
                  onPageChanged: onPageChanged,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: VaccinationCardShimmer(),
                    );
                  },
                ),
              );
            }
            if (state is VaccinationError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyles.body2Bold.copyWith(
                    color: AppColors.danger,
                  ),
                ),
              );
            }
            return SizedBox(height: 210);
          },
        ),
      ],
    );
  }
}

class VaccinationCardShimmer extends StatelessWidget {
  const VaccinationCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: 16.horizontal,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 140,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(height: 12),

            Container(
              width: 200,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 12),

            Container(
              width: 80,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 24),

            // مكان الأزرار
            Row(
              children: [
                // زر عرض
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // زر ذكرني
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
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
