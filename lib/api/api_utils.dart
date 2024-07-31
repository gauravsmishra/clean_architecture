import 'package:imdb_poc/api/environment.dart';

class AppUtils {
  AppUtils._();

  static String addBaseImageUrl(String path) => Environment.imageBaseUrl + path;
}
