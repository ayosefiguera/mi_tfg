import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/impl/default_user_facade.dart';
import 'package:eqlibrum/services/appointment_controller.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ScaffoldApp extends StatelessWidget {
  final Widget child;
  final int index;

  const ScaffoldApp({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    final defaulUserFacade = Provider.of<DefaultUserFacade>(context);
    UserDTO userDto = defaulUserFacade.userDTO;
    return Scaffold(
      appBar: AppBar(title: Text('Welcome,${userDto.name}'), actions: <Widget>[
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
