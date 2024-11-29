import 'package:flutter/material.dart';
import 'package:movie_app/api/api_consts.dart';

class NewreleaseWidget extends StatelessWidget {
  const NewreleaseWidget({super.key, required this.poster});

  final String? poster;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.33,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.transparent,
          image: DecorationImage(
              image: NetworkImage(ApiConsts.imageUrl + poster!),
              fit: BoxFit.fill)),
      child: Image.asset("assets/bookmark.png"),
    );
  }
}
