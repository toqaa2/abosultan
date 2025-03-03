

import 'package:abosultan/core/network/api_service.dart';

import 'core/utils/app_imports.dart';

void main()async {
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

      home: ScreenUtilInit(child: AppConstants.firstTimeToOpenApp? OnboardingScreen():SignInScreen()),
    );
  }
}

