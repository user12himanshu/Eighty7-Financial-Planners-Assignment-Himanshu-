import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/article_model.dart';
import 'package:untitled/utils/theme_util.dart';
import 'package:untitled/widgets/custom_error_widget.dart';
import 'package:untitled/widgets/read_more_button.dart';

import '../widgets/custom_back_buttom_row.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({super.key});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  Article article = Get.arguments['article'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: ReadMoreButton(
        articleLink: article.url,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30.0,
                  left: ThemeUtils.defaultHorizontalPadding,
                  right: ThemeUtils.defaultHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButtomRow(),
                  const SizedBox(height: 24),
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    article.author ?? "Anonymous",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    article.getTimeAgoText(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Hero(
              tag: article.title,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomNetworkImage(
                  url: article.urlToImage ?? "",
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(28),
                      topLeft: Radius.circular(28)),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                  horizontal: ThemeUtils.defaultHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    article.description ?? "",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    article.content ??
                        "Please tap on read more button more details.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Source:",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.source.name,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
