import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rika_online_store/core/cache/cache_constants.dart';
import 'package:rika_online_store/core/cache/cache_helper.dart';
import 'package:rika_online_store/core/routing/app_routes.dart';
import 'package:rika_online_store/core/utils/service_locator.dart';
import 'package:rika_online_store/feature/Home/presentation/ui/home_view.dart';
import 'package:rika_online_store/feature/auth/domain/repo/auth_repo.dart';
import 'package:rika_online_store/feature/auth/presentation/logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:rika_online_store/feature/auth/presentation/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:rika_online_store/feature/auth/presentation/ui/login_view.dart';
import 'package:rika_online_store/feature/auth/presentation/ui/sign_up_view.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: getInitialRoute(),
  routes: [
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.login,
      builder:
          (context, state) => BlocProvider(
            create: (context) => SignInCubit(getIt<AuthRepo>()),
            child: const LoginView(),
          ),
    ),
    GoRoute(
      path: AppRoutes.signUp,
      name: AppRoutes.signUp,
      builder:
          (context, state) => BlocProvider(
            create: (context) => SignUpCubit(getIt<AuthRepo>()),
            child: const SignUpView(),
          ),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.home,
      builder: (context, state) => const HomeView(),
    ),
  ],
);

getInitialRoute() {
  bool isLoggedIn =
      CacheHelper.getBool(key: CacheConstants.isLoggedIn) ?? false;
  if (isLoggedIn) {
    return AppRoutes.home;
  } else {
    return AppRoutes.login;
  }
}
