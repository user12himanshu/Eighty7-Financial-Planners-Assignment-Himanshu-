import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled/constants/api_constants.dart';
import 'package:untitled/models/latest_news_model.dart';
import 'package:untitled/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsHelper {
  Api api = Api();
  final String countryCode = 'in';

  Future<LatestNews> getLatestNews() async {
    Response r = await api.get(ApiConstants.latestNewsPath,
        queryParameters: {'country': countryCode});
    final data = r.data;
    LatestNews latestNews = LatestNews.fromMap(data);
    return latestNews;
  }

  Future<void> launchArticleUrl(String url) async {
    Uri uri = Uri.parse(url);
    bool shouldLaunchUrl = await canLaunchUrl(uri);
    if (shouldLaunchUrl) {
      await launchUrl(uri);
    } else {
      getx.Get.showSnackbar(const GetSnackBar(
        message: "Could not launch url!",
        duration: Duration(seconds: 2),
      ));
    }
  }
}
