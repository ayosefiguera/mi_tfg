import 'package:eqlibrum/models/models.dart';
import 'package:eqlibrum/views/widgets/widgets.dart';

abstract class PsychologistFacade{


  Future<List<Psychologist>> getAllPsychologist();
}
