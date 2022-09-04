import 'package:cloud_firestore/cloud_firestore.dart';
import '../../feature/tabbar/tabbar.dart';
import 'package:flutter/services.dart';
import '../../feature/auth/view/login_view.dart';
import '../../feature/onboard/view_model/onboard_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../feature/add_transaction/view_model/add_transaction_provider.dart';
import '../../feature/auth/service/firebase_auth_service.dart';
import '../../feature/auth/view_model/auth_provider.dart';
import '../../feature/charts/view_model/charts_provider.dart';
import '../../feature/history/viewmodel/history_provider.dart';
import '../../feature/onboard/view/onboard_view.dart';
import '../../feature/profile/viewmodel/profile_provider.dart';
import '../cache/cache_manager.dart';
import '../global/theme_notifier.dart';
import '../service/firebase_firestore_service.dart';
import 'localization_init.dart';
import 'screen_util_init.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class ProductInit {
  final LocalizationInit localizationInit = LocalizationInit();
  final ScreenUtilInit screenUtilInit = ScreenUtilInit();
  final CacheManager _manager = CacheManager.instance;

  List<SingleChildWidget> providers = [
    Provider<FirebaseAuthService>(
        create: (_) => FirebaseAuthService(FirebaseAuth.instance)),
    Provider<FireStoreService>(
        create: (_) => FireStoreService(FirebaseFirestore.instance)),
    StreamProvider(
        create: (context) => context.read<FirebaseAuthService>().authState,
        initialData: null),
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    ChangeNotifierProvider<AuthViewModel>(create: (context) => AuthViewModel()),
    ChangeNotifierProvider(create: (context) => AddTransactionProvider()),
    ChangeNotifierProvider<ProfileProvider>(
        create: (context) => ProfileProvider()),
    ChangeNotifierProvider<HistoryProvider>(
        create: (context) => HistoryProvider()),
    ChangeNotifierProvider<ChartsProvider>(
        create: (context) => ChartsProvider()),
    ChangeNotifierProvider<OnboardProvider>(
        create: (context) => OnboardProvider()),
  ];

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initSplash();
    FlutterNativeSplash.remove();
  }

  Future initSplash() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    await CacheManager.instance.initPref();
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp();
    _manager.readString(SharedKeys.currency) == null
        ? await _manager.saveString(SharedKeys.currency, "\$")
        : null;
  }

  Widget home() {
    return _manager.readBool(SharedKeys.IS_FIRST_APP) == null
        ? const OnboardView()
        : const AuthGate();
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return context.watch<User>() != null ? const TabView() : const LoginView();
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return const LoginView();
        }

        // Render your application if authenticated
        return const TabView();
      },
    );
  }
}
