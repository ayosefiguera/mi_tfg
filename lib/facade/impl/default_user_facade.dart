import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/user_facade.dart';
import 'package:eqlibrum/services/impl/default_user_service.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

class DefaultUserFacade extends ChangeNotifier implements UserFacade {
  var name = '';
  var email = '';

  DefaultUserFacade() {
    getUser();
  }

  final DefaultUserService defaultUserService = DefaultUserService();

  @override
  Future<String?> createUser(String email, String password, String name) {
    return getUserService().createUser(email, password, name);
  }

  @override
  getUser() async {
    Map map = await getUserService().getUser();
    name = map['name'];
    email = map['email'];
  }

  @override
  logout() {
    getUserService().logout();
  }

  @override
  Future<String?> loginUser(String email, String password) {
    return getUserService().loginUser(email, password);
  }

  DefaultUserService getUserService() {
    return defaultUserService;
  }

  @override
  Future<String> getIdToken() {
    return getUserService().getIdtoken();
  }
}
