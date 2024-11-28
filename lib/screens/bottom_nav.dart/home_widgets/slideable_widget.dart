import 'package:flutter/material.dart';

class SlideableWidget extends StatelessWidget {
  const SlideableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.37,
      child: Stack(
        children: [
          Image.asset(
            "assets/back.png",
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
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/poster.png"),
                        fit: BoxFit.fill)),
                child: Image.asset("assets/bookmark.png"),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dora and the lost city of gold",
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "2019   PG-13   2h 7m",
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
