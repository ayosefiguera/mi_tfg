import 'package:eqlibrum/facade/Legal_pages_facade.dart';
import 'package:eqlibrum/models/LegalPage.dart';
import 'package:eqlibrum/services/impl/default_legal_pages_services.dart';
import 'package:eqlibrum/services/legal_pages_services.dart';
import 'package:flutter/material.dart';

class DefaultLegalPageFacade extends ChangeNotifier implements LegalPageFacade {
  LegalPagesServices _legalPagesServices = DefaultLegalPagesServices();
  late LegalPage currentPage;

  @override
  Future<bool> getPage(String page) async {
    currentPage = await _getLegalPageServices().getPage(page);
    return (currentPage != null) ? true : false;
  }

  void setLegalPagesServices(LegalPagesServices legalPagesServices) {
    _legalPagesServices = legalPagesServices;
  }

  LegalPagesServices _getLegalPageServices() {
    return _legalPagesServices;
  }
}
