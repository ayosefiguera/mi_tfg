import 'package:eqlibrum/views/themes/themes.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key, required this.page});
  final String page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text(
              "$page",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.primary,
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: const Text(
                  """
Lorem ipsum dolor sit amet consectetur adipiscing elit orci suscipit dui hac, ultrices laoreet quisque vehicula lacus nascetur dictum neque pharetra fusce, venenatis senectus augue dis maecenas primis sodales nunc lobortis etiam. Proin fames felis fusce pharetra primis elementum eros nibh cursus facilisi, dui tincidunt curae at laoreet sodales a dis netus. Ante proin consequat ridiculus et ornare in nec sed a, metus eros feugiat condimentum platea tempor facilisis aliquam viverra, sodales molestie eleifend imperdiet leo curae elementum blandit.

Risus aenean felis eleifend natoque semper platea iaculis maecenas varius ridiculus, justo lacus sollicitudin fames cras senectus sem viverra luctus urna, torquent sed erat morbi aliquam curae dignissim ante bibendum. Potenti per sem quis massa pharetra sollicitudin accumsan, hendrerit facilisi mattis ullamcorper platea maecenas, elementum interdum dictum purus lacus netus. Semper pretium sem parturient maecenas fames blandit pellentesque tellus eu quam, mauris interdum quisque ligula donec lacus auctor mi primis, facilisi conubia fermentum habitasse ullamcorper aliquet risus tincidunt sociis.

Lorem ipsum dolor sit amet consectetur adipiscing elit orci suscipit dui hac, ultrices laoreet quisque vehicula lacus nascetur dictum neque pharetra fusce, venenatis senectus augue dis maecenas primis sodales nunc lobortis etiam. Proin fames felis fusce pharetra primis elementum eros nibh cursus facilisi, dui tincidunt curae at laoreet sodales a dis netus. Ante proin consequat ridiculus et ornare in nec sed a, metus eros feugiat condimentum platea tempor facilisis aliquam viverra, sodales molestie eleifend imperdiet leo curae elementum blandit.

Risus aenean felis eleifend natoque semper platea iaculis maecenas varius ridiculus, justo lacus sollicitudin fames cras senectus sem viverra luctus urna, torquent sed erat morbi aliquam curae dignissim ante bibendum. Potenti per sem quis massa pharetra sollicitudin accumsan, hendrerit facilisi mattis ullamcorper platea maecenas, elementum interdum dictum purus lacus netus. Semper pretium sem parturient maecenas fames blandit pellentesque tellus eu quam, mauris interdum quisque ligula donec lacus auctor mi primis, facilisi conubia fermentum habitasse ullamcorper aliquet risus tincidunt sociis.
""",
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ))
          ],
        )),
      ),
    );
  }
}
