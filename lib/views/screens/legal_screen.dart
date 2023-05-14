import 'package:eqlibrum/facade/impl/default_legal_page_facade.dart';
import 'package:eqlibrum/models/legal_page.dart';
import 'package:eqlibrum/views/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key, required this.page});
  final String page;

  @override
  Widget build(BuildContext context) {
    final legalPageService = Provider.of<DefaultLegalPageFacade>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
          ),
        ),
        body: FutureBuilder<bool>(
            future: legalPageService.getPage(page),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        color: AppTheme.primary,
                      )),
                );
              } else {
                if (snapshot.data == true) {
                  return PagesWidget(legalPage: legalPageService.currentPage);
                } else {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
              }
            }));
  }
}

class PagesWidget extends StatelessWidget {
  const PagesWidget({
    super.key,
    required this.legalPage,
  });

  final LegalPage legalPage;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Text(
            legalPage.title,
            style: AppTheme.styleTextTitle,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                legalPage.content,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ))
        ],
      )),
    );
  }
}
