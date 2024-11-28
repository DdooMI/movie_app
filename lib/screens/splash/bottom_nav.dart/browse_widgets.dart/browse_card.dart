import 'package:flutter/material.dart';

class BrowseCard extends StatelessWidget {
  const BrowseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage("assets/browseImage.png"), fit: BoxFit.fill)),
      child: Text(
        "Action",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
