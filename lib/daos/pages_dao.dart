
import 'package:eqlibrum/models/LegalPage.dart';

/// An interface for Pages DAO including operations for retrieving 
/// persistend pages model objects.
///
///[author] Ayose Figuera Alfonso
///[Link] ayo.afa@gmail.com
abstract class PagesDao {

  /// Get a Pages from persistenace data.
  ///
  /// Return [String] the idToken or empty string.
  Future<LegalPage> getPage(String page);
}
