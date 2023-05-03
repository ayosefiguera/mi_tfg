import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/models/psychologist.dart';
import 'package:flutter/material.dart';

// Facade for managing Psychologist
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class PsychologistFacade extends ChangeNotifier {
  /// Get all existing psychologist
  ///
  /// return [List] the list of al psychologist.
  Future<List<PsychologistDTO>> getAllPsychologist();

  // Create NewPsychologist.
  Future<bool> createUser(PsychologistDTO psychologistDTO);

}
