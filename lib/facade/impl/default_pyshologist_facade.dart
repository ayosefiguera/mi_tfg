import 'package:eqlibrum/facade/psychologist_facade.dart';
import 'package:eqlibrum/models/models.dart';
import 'package:eqlibrum/services/impl/default_pyschologist_service.dart';
import 'package:eqlibrum/views/screens/screens.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

class DefaultPsychologistFacade extends ChangeNotifier
    implements PsychologistFacade {
      
  DefaultPsychologistFacade() {
    getAllPsychologist();
  }

  List<Psychologist> psychologists = [];

  bool isLoading = false;
  bool isSaving = false;

  final defaultPsychologistService = DefaultPsychologistService();

  @override
  Future<List<Psychologist>> getAllPsychologist() async {
    isLoading = true;
    notifyListeners();
    psychologists = await getPsychologistService().getAllPsychologist();
    isLoading = false;
    notifyListeners();
    return psychologists;
  }

  DefaultPsychologistService getPsychologistService() {
    return defaultPsychologistService;
  }
}
