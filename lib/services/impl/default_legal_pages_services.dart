import 'package:eqlibrum/daos/impl/default_pages_dao.dart';
import 'package:eqlibrum/daos/pages_dao.dart';
import 'package:eqlibrum/models/LegalPage.dart';
import 'package:eqlibrum/services/legal_pages_services.dart';
import 'package:flutter/material.dart';

class DefaultLegalPagesServices implements LegalPagesServices {
  PagesDao _pagesDao = DefaultPagesDAO();

  @override
  Future<LegalPage> getPage(final String page) async {
    return await _getPageDao().getPage(page);
  }

  void setPageDao(PagesDao pagesDao) {
    _pagesDao = pagesDao;
  }

  PagesDao _getPageDao() {
    return _pagesDao;
  }
}
