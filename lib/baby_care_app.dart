import 'package:baby_care/core/cubit/cubit/current_child_cubit.dart';
import 'package:baby_care/core/cubit/cubit/locale_cubit.dart';
import 'package:baby_care/core/helper_functions/on_generate_routes.dart';
import 'package:baby_care/core/services/get_it_service.dart';
import 'package:baby_care/core/theme/app_theme.dart';
import 'package:baby_care/features/auth/data/repositories/auth_repository.dart';
import 'package:baby_care/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:baby_care/features/auth/presentation/cubit/auth_state.dart';
import 'package:baby_care/features/auth/presentation/view/sign_in_view.dart';
import 'package:baby_care/features/children/data/repositories/children_repository.dart';
import 'package:baby_care/features/children/presentation/cubit/children_cubit.dart';
import 'package:baby_care/features/main_layout/presentation/cubit/navigation_cubit.dart';
import 'package:baby_care/features/main_layout/presentation/view/main_layout_view.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BabyCareApp extends StatelessWidget {
  const BabyCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleCubit()),
        BlocProvider(
          create: (_) =>
              AuthCubit(authRepository: sl<AuthRepository>()..checkAuth()),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          return BlocBuilder<LocaleCubit, String>(
            builder: (context, locale) {
              return ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  final materialApp = MaterialApp(
                    locale: Locale(locale),
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.lightTheme,
                    onGenerateRoute: onGenerateRoute,
                    // home: authState is AuthSuccess
                    //     ? const MainLayoutView()
                    //     : const SignInView(),
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                  );

                  if (authState is AuthSuccess) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (_) => NavigationCubit()),
                        BlocProvider(
                          create: (_) => ChildrenCubit(
                            repository: sl<ChildrenRepository>(),
                          )..getChildren(),
                        ),
                        BlocProvider(create: (_) => CurrentChildCubit()),
                      ],
                      child: materialApp,
                    );
                  }

                  return materialApp;
                },
              );
            },
          );
        },
      ),
    );
  }
}
