import 'package:abosultan/core/helper/cache_helper.dart';

abstract class AppConstants {
  static bool get firstTimeToOpenApp  => CacheHelper.getData(key: CacheKeys.firstTimeToOpenApp)??true;
}
