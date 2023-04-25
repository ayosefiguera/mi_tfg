
import 'package:eqlibrum/views/widgets/widgets.dart';

class NotifyListScreen extends StatelessWidget {
  const NotifyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('notify'), actions: <Widget>[
          //TODO Create Hero profile.
          IconButton(onPressed: () {}, icon: const Icon(Icons.person))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO Add navigation to phone jitsi room.
          },
          child: const Icon(Icons.phone),
        ),
        bottomNavigationBar: const BottonNavContainer(currentIndex: 3),
        body: const Text('notify'));
  }
}
