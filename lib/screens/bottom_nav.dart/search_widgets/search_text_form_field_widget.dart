import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_colors.dart';

class SearchTextFormFieldWidget extends StatelessWidget {
  const SearchTextFormFieldWidget(
      {super.key, required this.controller, required this.onChanged});
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.grey, borderRadius: BorderRadius.circular(50)),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        cursorHeight: 25,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 25,
            ),
            hintText: "Search....",
            hintStyle: Theme.of(context).textTheme.bodyLarge,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.third),
                borderRadius: BorderRadius.circular(50)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.third),
                borderRadius: BorderRadius.circular(50)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.third),
                borderRadius: BorderRadius.circular(50)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.third),
                borderRadius: BorderRadius.circular(50)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.third),
                borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}
