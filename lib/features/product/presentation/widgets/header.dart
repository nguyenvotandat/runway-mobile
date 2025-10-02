import 'package:flutter/material.dart';
import 'package:runway_mobile/core/design_system/app_spacing.dart';
import 'package:runway_mobile/features/product/presentation/widgets/search.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.screenMargin(context).left * 2,
        ),
        child: const Column(children: [Search()]),
      ),
    );
  }
}
