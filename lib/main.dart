import 'package:easy_localization/easy_localization.dart';

import 'core/utils/app_imports.dart';
import 'i18n/codegen_loader.g.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  await ApiService.init();
  await EasyLocalization.ensureInitialized();
// await CacheHelper.removeData(key: CacheKeys.firstTimeToOpenApp);
  runApp(EasyLocalization(
      assetLoader: const CodegenLoader(),
      startLocale: const Locale('ar'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/i18n',
      useFallbackTranslations: true,
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
    localizationsDelegates: context.localizationDelegates,
    locale: context.locale,
    debugShowCheckedModeBanner: false,
    title: 'Abo Sultan',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home:
       ScreenUtilInit(
            child: AppConstants.firstTimeToOpenApp
                ? OnboardingScreen()
                : SignInScreen())
          );
  }
}
