import 'package:eqlibrum/dto/psychologist_dto.dart';
import 'package:eqlibrum/models/models.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

// Facade for managing Psychologist
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class PsychologistFacade{

/// Get all existing psychologist
/// 
/// return [List] the list of al psychologist.
  Future<List<PsychologistDTO>> getAllPsychologist();
}
