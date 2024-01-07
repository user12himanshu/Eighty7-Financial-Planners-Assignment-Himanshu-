import 'package:flutter/material.dart';
import 'package:untitled/utils/news_helper.dart';
import 'package:untitled/utils/theme_util.dart';

class ReadMoreButton extends StatelessWidget {
  final String articleLink;

  const ReadMoreButton({
    super.key,
    required this.articleLink,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NewsHelper newsHelper = NewsHelper();
        newsHelper.launchArticleUrl(articleLink);
      },
      child: Container(
        width: 131,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
            color: ThemeUtils.secondryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(82, 130, 255, 0.51),
                  offset: Offset(0, 4),
                  blurRadius: 18)
            ]),
        child: Center(
          child: Text(
            'Read More',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
