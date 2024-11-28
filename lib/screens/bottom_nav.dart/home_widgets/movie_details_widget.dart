import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_colors.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/back.png",
          fit: BoxFit.contain,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dora and the lost city of gold",
                style: Theme.of(context).textTheme.titleMedium,
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage("assets/poster.png"),
                        fit: BoxFit.fill)),
                child: Image.asset("assets/bookmark.png"),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 10,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 4)),
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: AppColors.grey),
                                  bottom: BorderSide(color: AppColors.grey),
                                  right: BorderSide(color: AppColors.grey),
                                  left: BorderSide(color: AppColors.grey),
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Action",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      '''Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ''',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.gold,
                          size: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "7.7",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
