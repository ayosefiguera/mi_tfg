import 'package:eqlibrum/views/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MediaCardWidget extends StatelessWidget {
  MediaCardWidget({super.key});
  final boxContainer = BoxDecoration(
      color: Colors.blue.shade50, borderRadius: BorderRadius.circular(20));
  final mediaPicture = BoxDecoration(
      color: AppTheme.backgroundDark.withAlpha(80),
      borderRadius: BorderRadius.circular(20));
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: boxContainer,
      child: Row(
        children: [
          Container(
            decoration: mediaPicture,
            width: 150,
            height: 170,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            width: 180,
            child: Column(
              children: [
                const Center(
                    child: Text(
                  'Title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tristique vehicula sapien eget finibus. Sed ut eleifend eros, non rhoncus sapien. Vivamus vel mattis massa.',
                  style: TextStyle(
                    fontSize: 12,
                    overflow: TextOverflow.fade,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      'Date:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('xx-xx-xxxx hh:mm'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
