import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class RecommendationRatio extends StatelessWidget {
  RecommendationRatio({super.key, this.vote});
  int? vote;

    

  @override
  Widget build(BuildContext context) {

  vote ??= 0;
   
    return Row(
      children: [
        const Icon(Icons.thumb_up_alt_outlined, color: AppTheme.primary),
        const SizedBox(
          width: 8,
        ),
        Text(
          '$vote recommendation.',
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
