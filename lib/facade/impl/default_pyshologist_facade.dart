import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/dto/user_dto.dart';
import 'package:eqlibrum/facade/psychologist_facade.dart';
import 'package:eqlibrum/mappers/impl/pyschologist_mapper.dart';
import 'package:eqlibrum/models/psychologist.dart';
import 'package:eqlibrum/services/impl/default_pyschologist_service.dart';
import 'package:eqlibrum/services/psychologist_service.dart';
import 'package:flutter/material.dart';

class DefaultPsychologistFacade extends ChangeNotifier
    implements PsychologistFacade {
  PsychologistService _psychologistService = DefaultPsychologistService();

  PsychologistMapper mapper = PsychologistMapper();

  DefaultPsychologistFacade() {
    getAllPsychologist();
  }

  List<PsychologistDTO> psychologistsDTO = [];

  bool isLoading = false;
  bool isSaving = false;

  @override
  Future<List<PsychologistDTO>> getAllPsychologist() async {
    List<Psychologist> psychologists = [];
    isLoading = true;
    notifyListeners();
    psychologists = await _getPsychologistService().getAllPsychologist();

    psychologistsDTO = mapper.toDTOList(psychologists);

    isLoading = false;
    notifyListeners();
    return psychologistsDTO;
  }

  @override
  Future<bool> createUser(UserDTO psychologistDTO) {
    return _getPsychologistService()
        .createPsychologist(mapper.toEntity(psychologistDTO));
  }

  PsychologistService _getPsychologistService() {
    return _psychologistService;
  }

  setPsychologistService(PsychologistService psychologistService) {
    _psychologistService = psychologistService;
  }

  @override
  Future<bool> updateUser(UserDTO psychologistDTO) {
    // TODO: implement UpdateUser
    throw UnimplementedError();
  }

  @override
  Future<String> getPsychologistName(String id) async {
    Psychologist psychologist = Psychologist();
    psychologist =
        await _getPsychologistService().getPsychologistById(id) ?? psychologist;
    return "${psychologist.name} ${psychologist.surname}";
  }
}
