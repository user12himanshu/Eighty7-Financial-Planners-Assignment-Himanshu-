import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/constants/constants.dart';

class NewsLoadingWidget extends StatelessWidget {
  const NewsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Center(
        child: Lottie.asset('${AppConstants.assetLottiePath}news_loading.json'),
      ),
    );
  }
}
