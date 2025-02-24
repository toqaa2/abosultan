import 'package:easy_localization/easy_localization.dart';

import 'core/utils/app_imports.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  await ApiService.init();
// CacheHelper.removeData(key: CacheKeys.firstTimeToOpenApp);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abo Sultan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EasyLocalization(
          // assetLoader: const CodegenLoader(),
          startLocale: const Locale('en'),
          supportedLocales: const [Locale('en'), Locale('ar')],
          path: 'assets/i18n',
          useFallbackTranslations: true,
          fallbackLocale: const Locale('en'),
          saveLocale: true,
          child: ScreenUtilInit(
              child: AppConstants.firstTimeToOpenApp
                  ? OnboardingScreen()
                  : SignInScreen())),
    );
  }
}
