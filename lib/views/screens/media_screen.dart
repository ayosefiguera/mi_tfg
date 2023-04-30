import 'package:eqlibrum/views/themes/themes.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(index: 3, child: Media(title: title));
  }
}

class Media extends StatelessWidget {
  const Media({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Text(
            title,
            style: AppTheme.styleTextTitle,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (_, index) => MediaCardWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

