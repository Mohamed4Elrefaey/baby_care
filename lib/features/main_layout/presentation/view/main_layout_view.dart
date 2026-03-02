import 'package:baby_care/features/home/presentation/view/home_view.dart';
import 'package:baby_care/features/main_layout/data/navbar_item_model.dart';
import 'package:baby_care/features/main_layout/presentation/cubit/navigation_cubit.dart';
import 'package:baby_care/features/main_layout/presentation/view/widgets/custom_nav_bar.dart';
import 'package:baby_care/features/profile/presentation/view/widgets/profile_view_body.dart';
import 'package:baby_care/features/services/presentation/view/services_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});
  static const routeName = '/main-layout';

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  late List<NavModel> navItems;
  final List<Widget> pages = [
    const HomeView(),
    const Scaffold(body: Center(child: Text('Tracking Page'))),
    const ServicesView(),
    const Scaffold(body: Center(child: Text('Community Page'))),
    ProfileViewBody(),
  ];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    navItems = [
      NavModel(
        title: S.of(context).navHome,
        assetName: 'assets/svg/home-icon.svg',
      ),
      NavModel(
        title: S.of(context).navTracking,
        assetName: 'assets/svg/nav_tracking.svg',
      ),
      NavModel(
        title: S.of(context).navServices,
        assetName: 'assets/svg/nav_servicessvg.svg',
      ),
      NavModel(
        title: S.of(context).navCommunity,
        assetName: 'assets/svg/nav_community.svg',
      ),
      NavModel(
        title: S.of(context).navAccount,
        assetName: 'assets/svg/nav_account.svg',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: state, children: pages),
          bottomNavigationBar: CustomNavBar(
            navItems: navItems,
            selectedIndex: state,
            onTap: (value) {
              context.read<NavigationCubit>().changeIndex(value);
            },
          ),
        );
      },
    );
  }
}
