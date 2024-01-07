import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/utils/theme_util.dart';

class CustomBackButtomRow extends StatelessWidget {
  const CustomBackButtomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            CupertinoIcons.back,
            size: 32,
            color: ThemeUtils.primaryColor,
          ),
        )
      ],
    );
  }
}
