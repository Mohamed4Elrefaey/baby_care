import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/cubit/cubit/current_child_cubit.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/children/data/model/child_model.dart';
import 'package:baby_care/features/home/presentation/view/widgets/app_bar_action_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBar extends StatefulWidget {
  const CustomHomeAppBar({super.key, required this.child});

  final List<ChildModel> child;

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  int currentIndex = 0;
  late ChildModel currentChild;

  @override
  void initState() {
    super.initState();
    if (widget.child.isNotEmpty) {
      currentChild = widget.child[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentChildCubit, String?>(
      listener: (context, state) async {},
      builder: (context, state) {
        if (state.isNotNull && widget.child.isNotEmpty) {
          try {
            currentChild = widget.child.firstWhere((child) => child.id == state);
          } catch (e) {
            // Handle if child not found, keep existing or reset to first
            if (widget.child.isNotEmpty) {
              currentChild = widget.child[0];
            }
          }
        } else if (widget.child.isNotEmpty) {
          currentChild = widget.child[0];
        } else {
          // Fallback if list is empty
          return const SizedBox.shrink();
        }

        return Padding(
          padding: Constants.khorizontalPadding.horizontal,
          child: Row(
            children: [
              SvgPicture.asset(
                currentChild.gender == 'boy'
                    ? 'assets/svg/Baby.svg'
                    : 'assets/svg/girl.svg',
                height: 50,
              ),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(currentChild.name, style: AppTextStyles.textStyle15),
                  Text(
                    calculateAge(currentChild.dateOfBirth),
                    style: AppTextStyles.captionRagular.copyWith(
                      color: AppColors.dText,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              AppBarActionIcon(
                onTab: () {},
                svgIconPath: 'assets/svg/notifications.svg',
              ),
              4.width,
              AppBarActionIcon(
                onTab: () async {
                  if (widget.child.isNotEmpty) {
                    if (currentIndex < widget.child.length - 1) {
                      currentIndex++;
                    } else {
                      currentIndex = 0;
                    }
                    BlocProvider.of<CurrentChildCubit>(
                      context,
                    ).setCurrentChild(widget.child[currentIndex].id);
                  }
                },
                svgIconPath: 'assets/svg/switch.svg',
              ),
            ],
          ),
        );
      },
    );
  }

  String calculateAge(DateTime? birthDate) {
    if (birthDate == null) return '—';
    final now = DateTime.now();

    int years = now.year - birthDate.year;
    int months = now.month - birthDate.month;

    if (now.day < birthDate.day) {
      months--;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    String yearText = years > 0 ? '$years سنة' : '';
    String monthText = months > 0 ? '$months شهر' : '';

    if (yearText.isNotEmpty && monthText.isNotEmpty) {
      return '$yearText $monthText';
    } else if (yearText.isNotEmpty) {
      return yearText;
    } else if (monthText.isNotEmpty) {
      return monthText;
    } else {
      return '0 شهر';
    }
  }
}
