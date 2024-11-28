import 'package:flutter/material.dart';

class NewreleaseWidget extends StatelessWidget {
  const NewreleaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.33,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("assets/poster.png"), fit: BoxFit.fill)),
      child: Image.asset("assets/bookmark.png"),
    );
  }
}
