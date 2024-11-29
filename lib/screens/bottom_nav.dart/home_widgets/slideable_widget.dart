import 'package:flutter/material.dart';
import 'package:movie_app/api/api_consts.dart';

class SlideableWidget extends StatelessWidget {
  const SlideableWidget(
      {super.key,
      required this.backImage,
      required this.poster,
      required this.title,
      required this.date});

  final String? backImage;
  final String? poster;
  final String? title;
  final String? date;

  @override
  Widget build(BuildContext context) {
    String yearDate = date!.substring(0, 4);
    return Container(
      height: MediaQuery.of(context).size.height * 0.37,
      child: Stack(
        children: [
          Image.network(
            ApiConsts.imageUrl + backImage!,
            fit: BoxFit.contain,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(ApiConsts.imageUrl + poster!),
                        fit: BoxFit.fill)),
                child: Image.asset("assets/bookmark.png"),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      yearDate,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w300),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
