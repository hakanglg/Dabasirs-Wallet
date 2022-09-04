import '../../feature/auth/view/login_view.dart';
import '../../feature/auth/view/register_view.dart';
import '../../feature/onboard/view/onboard_view.dart';
import '../../feature/tabbar/tabbar.dart';

class NavigatorRoutes {
  // static const slash = "/";
  final items = {
    // slash: (context) => LoginView(),
    NavigateRoutes.login.withSlash: ((context) => const LoginView()),
    NavigateRoutes.register.withSlash: ((context) => const RegisterView()),
    NavigateRoutes.tab.withSlash: ((context) => const TabView()),
    NavigateRoutes.onboard.withSlash: ((context) => const OnboardView()),
  };
}

enum NavigateRoutes { login, register, tab, onboard }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withSlash => "/$name";
}
