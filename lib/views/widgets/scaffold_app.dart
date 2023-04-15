import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/services/services.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ScaffoldApp extends StatelessWidget {
  final Widget child;
  final int index;

  const ScaffoldApp({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    final defaulUserFacade = Provider.of<DefaultUserFacade>(context);
    return Scaffold(
      appBar:
          AppBar(title: Text('Welcome,${defaulUserFacade.name}'), actions: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'profile');
            },
            icon: const Icon(Icons.person))
      ]),
      bottomNavigationBar: BottonNavContainer(
        currentIndex: index,
      ),
      body: child,
    );
  }
}
