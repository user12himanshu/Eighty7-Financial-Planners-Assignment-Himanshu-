import 'package:get/get.dart';
import 'package:untitled/screens/article_detail_screen.dart';
import 'package:untitled/screens/home_screen.dart';

class RouteService {
  static const String homeScreenRoute = '/homeScreenRoute';
  static const String articleDetail = '/articleDetail';

  List<GetPage> pages = [
    GetPage(name: homeScreenRoute, page: () => const HomeScreen()),
    GetPage(name: articleDetail, page: () => const ArticleDetailScreen()),
  ];
}
