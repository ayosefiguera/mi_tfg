import 'package:flutter/material.dart';
import 'package:eqlibrum/views/themes/themes.dart';

class SingFormsContainer extends StatelessWidget {
  Widget child;
  String title;
  String? name;

  SingFormsContainer(
      {super.key, required this.child, required this.title, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 40, vertical: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60))),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          if (name?.isNotEmpty ?? false)
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                name!,
                style: TextStyle(fontSize: 18),
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey,
              )
            ]),
          this.child,
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
