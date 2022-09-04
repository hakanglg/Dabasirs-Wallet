import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/constants/app/app_constants.dart';
import 'product/global/theme_notifier.dart';
import 'product/init/product_init.dart';
import 'product/navigator/navigator_routes.dart';
import 'package:kartal/kartal.dart';


Future<void> main() async {
  final productInit = ProductInit();
  await productInit.init();

  runApp(MultiProvider(
    providers: productInit.providers,
    child: EasyLocalization(
        supportedLocales: productInit.localizationInit.supportedLocales,
        path: productInit.localizationInit.localizationPath,
        startLocale: productInit.localizationInit.supportedLocales.first,
        fallbackLocale: productInit.localizationInit.supportedLocales.first,
        child: ScreenUtilInit(
            designSize: productInit.screenUtilInit.designSize,
            minTextAdapt: productInit.screenUtilInit.minTextAdapt,
            splitScreenMode: productInit.screenUtilInit.splitScreenMode,
            builder: (context, child) {
              return const MyApp();
            })),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: ApplicationConstants.APP_TITLE,
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      home: ProductInit().home(),
      routes: NavigatorRoutes().items,
    );
  }
}
