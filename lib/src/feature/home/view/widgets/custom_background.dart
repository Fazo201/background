import 'dart:ui';

import 'package:currency_app/src/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(20, -1.2),
          child: SizedBox(
            height: context.mediaQuery.size.width,
            width: context.mediaQuery.size.width,
            child: DecoratedBox(decoration: BoxDecoration(shape: BoxShape.circle, color: context.theme.colorScheme.tertiary)),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(2.7, -1.2),
          child: SizedBox(
            height: context.mediaQuery.size.width / 1.3,
            width: context.mediaQuery.size.width / 1.3,
            child: DecoratedBox(decoration: BoxDecoration(shape: BoxShape.circle, color: context.theme.colorScheme.primary)),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: const SizedBox(),
        ),
      ],
    );
  }
}
