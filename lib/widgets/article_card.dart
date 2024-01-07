import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/constants.dart';
import 'package:untitled/models/article_model.dart';
import 'package:untitled/services/route_service.dart';
import 'package:untitled/utils/theme_util.dart';
import 'package:untitled/widgets/custom_error_widget.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteService.articleDetail,
            arguments: {'article': article});
      },
      child: Container(
          padding: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(ThemeUtils.defaultBorderRadius),
              boxShadow: const [
                BoxShadow(
                    color: ThemeUtils.shadowColor,
                    offset: Offset(0, 10),
                    blurRadius: 15)
              ]),
          child: Row(
            children: [
              Hero(
                tag: article.title,
                child: SizedBox(
                  height: 141,
                  width: 92,
                  child: CustomNetworkImage(url: article.urlToImage ?? ""),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.author ?? "Anonymous",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 21),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                                '${AppConstants.assetIconsPath}time.png'),
                            const SizedBox(width: 8),
                            Text(article.getTimeAgoText())
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                                '${AppConstants.assetIconsPath}thumbs.png'),
                            const SizedBox(width: 8),
                            Text(article.getRandomLikesTag())
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
