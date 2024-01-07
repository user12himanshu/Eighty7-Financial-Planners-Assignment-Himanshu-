import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/article_model.dart';
import 'package:untitled/utils/news_helper.dart';
import 'package:untitled/utils/theme_util.dart';
import 'package:untitled/widgets/article_card.dart';
import 'package:untitled/widgets/default_error_widget.dart';
import 'package:untitled/widgets/news_loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsHelper newsHelper = NewsHelper();
  AsyncMemoizer asyncMemoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 30.0,
              left: ThemeUtils.defaultHorizontalPadding,
              right: ThemeUtils.defaultHorizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 24),
              FutureBuilder(
                future: asyncMemoizer.runOnce(() => newsHelper.getLatestNews()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final latestNewsData = snapshot.data!;
                    return ListView.separated(
                        itemCount: latestNewsData.articles.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemBuilder: (context, index) {
                          Article article = latestNewsData.articles[index];
                          return ArticleCard(article: article);
                        });
                  } else if (snapshot.hasError) {
                    return const DefaultErrorWidget();
                  } else {
                    return const NewsLoadingWidget();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
