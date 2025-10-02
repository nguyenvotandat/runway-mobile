import 'package:flutter/material.dart';
import 'package:runway_mobile/core/design_system/app_spacing.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.screenMargin(context).left,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -6),
              blurRadius: 0,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black26,
              offset: Offset(4, 4),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: "Search",
          ),
        ),
      ),
    );
  }
}
