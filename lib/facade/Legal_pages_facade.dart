// ignore: file_names
import 'package:flutter/material.dart';

abstract class LegalPageFacade extends ChangeNotifier{
  /// Get a Pages from persistenace data
  ///
  /// Return [bool] the idToken or empty string.
  Future<bool> getPage(String page);
}
