import 'package:flutter/material.dart';
import 'package:movie_app/screens/splash/bottom_nav.dart/watchList_widgets/watch_card.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.06, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Watchlist",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) {
                return WatchCard();
              },
              itemCount: 10,
              separatorBuilder: (_, index) {
                return Divider();
              },
            ),
          )
        ],
      ),
    );
  }
}
