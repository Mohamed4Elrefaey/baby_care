import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/cubit/cubit/current_child_cubit.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/widgets/empty_home_app_bar.dart';
import 'package:baby_care/features/children/presentation/cubit/children_cubit.dart';
import 'package:baby_care/features/children/presentation/cubit/children_state.dart';
import 'package:baby_care/features/home/presentation/view/widgets/articles_section.dart';
import 'package:baby_care/features/home/presentation/view/widgets/community_section.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:baby_care/features/home/presentation/view/widgets/sounds_section.dart';
import 'package:baby_care/features/home/presentation/view/widgets/vaccination_section.dart';
import 'package:baby_care/features/vaccination/presentation/cubit/vaccination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int vaccinationCurrentIndex = 0;
  int communityCurrentIndex = 0;
  int articlesCurrentIndex = 0;

  final PageController vaccinationController = PageController(
    viewportFraction: 0.75,
  );
  final PageController communityController = PageController(
    viewportFraction: 0.90,
  );
  final PageController articlesController = PageController(
    viewportFraction: 0.90,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CurrentChildCubit, String?>(
      listener: (context, state) {
        if (state != null) {
          context.read<VaccinationCubit>().getVaccinationHome(state);
        }
      },
      child: BlocBuilder<ChildrenCubit, ChildrenState>(
        builder: (context, state) {
          if (state is ChildrenLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Constants.ktopPadding.height,
                  CustomHomeAppBar(child: state.children),
                  22.height,
                  VaccinationSection(
                    currentIndex: vaccinationCurrentIndex,
                    controller: vaccinationController,
                    onPageChanged: (index) {
                      setState(() {
                        vaccinationCurrentIndex = index;
                      });
                    },
                  ),
                  24.height,
                  // SoundsSection(),
                  // 24.height,
                  // CommunitySection(
                  //   controller: communityController,
                  //   currentIndex: communityCurrentIndex,
                  //   onPageChanged: (value) {
                  //     setState(() {
                  //       communityCurrentIndex = value;
                  //     });
                  //   },
                  // ),
                  // 24.height,
                  // ArticlesSection(
                  //   controller: articlesController,
                  //   currentIndex: articlesCurrentIndex,
                  //   onPageChanged: (value) {
                  //     setState(() {
                  //       articlesCurrentIndex = value;
                  //     });
                  //   },
                  // ),
                  // 25.height,
                ],
              ),
            );
          }
          if (state is ChildrenLoading) {
            return Center(child: Lottie.asset('assets/animation/loading.json'));
          }
          if (state is ChildrenError) {
            return Center(child: Text(state.message));
          }
          if (state is ChildrenEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Constants.ktopPadding.height,

                  EmptyHomeAppBar(),
                  22.height,

                  // SoundsSection(),
                  // 24.height,
                  // CommunitySection(
                  //   controller: communityController,
                  //   currentIndex: communityCurrentIndex,
                  //   onPageChanged: (value) {
                  //     setState(() {
                  //       communityCurrentIndex = value;
                  //     });
                  //   },
                  // ),
                  // 24.height,
                  // ArticlesSection(
                  //   controller: articlesController,
                  //   currentIndex: articlesCurrentIndex,
                  //   onPageChanged: (value) {
                  //     setState(() {
                  //       articlesCurrentIndex = value;
                  //     });
                  //   },
                  // ),
                  // 25.height,
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    vaccinationController.dispose();
    communityController.dispose();
    articlesController.dispose();
  }
}
