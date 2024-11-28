import 'package:flutter/material.dart';
import 'package:movie_app/screens/bottom_nav.dart/browse_widgets.dart/browse_card.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.06, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse Category",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 4),
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return BrowseCard();
                  }),
            ),
          )
        ],
      ),
    );
  }
}
