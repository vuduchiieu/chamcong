import 'package:chamcong/core/models/info_user_company.dart';
import 'package:chamcong/core/models/info_user_staff.dart';
import 'package:chamcong/modules/auth/login/forgot_password/screen/forgot_password.dart';
import 'package:chamcong/modules/auth/intro_auth/screen/intro_auth_screen.dart';
import 'package:chamcong/modules/auth/login/screen/login_screen.dart';
import 'package:chamcong/modules/auth/register/screen/company/authentication_otp.dart';
import 'package:chamcong/modules/auth/register/screen/register_screen.dart';
import 'package:chamcong/modules/auth/select_auth/screen/select_auth_screen.dart';
import 'package:chamcong/modules/home/screen/homeCompany.dart';
import 'package:chamcong/modules/home/screen/home_staff.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const IntroAuth();
      },
    ),
    GoRoute(
      path: '/select-auth',
      builder: (context, state) {
        return SelectAuth(
          isRegister: state.extra as bool,
        );
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return RegisterScreen(argument: state.extra as Map<String, dynamic>);
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return LoginScreen(argument: state.extra as Map<String, dynamic>);
      },
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) {
        return ForgotPassword(
          isCompany: state.extra as bool,
        );
      },
    ),
    GoRoute(
      path: '/authentication-otp',
      builder: (context, state) {
        return AuthenticationOtp(argument: state.extra as Map<String, dynamic>);
      },
    ),
    GoRoute(
      path: '/home-company',
      builder: (context, state) {
        return HomeCompany(
          infoUser: state.extra as InfoUserCompany,
        );
      },
    ),
    GoRoute(
      path: '/home-staff',
      builder: (context, state) {
        return HomeStaff(
          infoUser: state.extra as InfoUserStaff,
        );
      },
    ),
  ],
);
