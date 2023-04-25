import 'package:eqlibrum/models/LegalPage.dart';

abstract class LegalPagesServices {
  /// Get a Pages from persistenace data
  ///
  /// Return [bool] the idToken or empty string.
  Future<LegalPage> getPage(String page);
}
