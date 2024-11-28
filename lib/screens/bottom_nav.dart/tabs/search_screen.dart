import 'package:flutter/material.dart';
import 'package:movie_app/screens/bottom_nav.dart/search_widgets/search_text_form_field_widget.dart';
import 'package:movie_app/screens/bottom_nav.dart/watchList_widgets/watch_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextFormFieldWidget(controller: controller),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return WatchCard();
                },
                itemCount: 10,
                separatorBuilder: (_, index) {
                  return Divider();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
