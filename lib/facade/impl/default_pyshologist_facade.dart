import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/facade/psychologist_facade.dart';
import 'package:eqlibrum/mappers/impl/pyschologist_mapper.dart';
import 'package:eqlibrum/models/psychologist.dart';
import 'package:eqlibrum/services/impl/default_pyschologist_service.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

class DefaultPsychologistFacade extends ChangeNotifier
    implements PsychologistFacade {
  PsychologistMapper mapper = PsychologistMapper();

  DefaultPsychologistFacade() {
    getAllPsychologist();
  }

  List<PsychologistDTO> psychologistsDTO = [];

  bool isLoading = false;
  bool isSaving = false;

  final defaultPsychologistService = DefaultPsychologistService();

  @override
  Future<List<PsychologistDTO>> getAllPsychologist() async {
    List<Psychologist> psychologists = [];
    isLoading = true;
    notifyListeners();
    psychologists = await getPsychologistService().getAllPsychologist();

    psychologistsDTO = mapper.toDTOList(psychologists);

    isLoading = false;
    notifyListeners();
    return psychologistsDTO;
  }

  DefaultPsychologistService getPsychologistService() {
    return defaultPsychologistService;
  }
}
