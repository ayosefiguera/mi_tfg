import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class RecommendationRatio extends StatelessWidget {
  const RecommendationRatio({super.key, this.vote});
  final int? vote;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.thumb_up_alt_outlined, color: AppTheme.primary),
        const SizedBox(
          width: 8,
        ),
        Text(
          '${vote ?? 0} recommendation.',
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
