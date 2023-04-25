import 'package:flutter/material.dart';

class SingFormsContainer extends StatelessWidget {
  
  final Widget child;
  final String title;
  final String? name;

  const SingFormsContainer(
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
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          if (name?.isNotEmpty ?? false)
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                name!,
                style: const TextStyle(fontSize: 18),
              ),
              const CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey,
              )
            ]),
          child,
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
