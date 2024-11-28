import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_colors.dart';

class WatchCard extends StatelessWidget {
  const WatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 100,
      color: AppColors.primary,
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/watchListimage.png"),
                    fit: BoxFit.fill)),
            child: Image.asset("assets/bookmark.png"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Alite Battle Angel",
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "2019",
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Rosa Salszar, Christoph Waltz",
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
