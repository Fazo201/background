import "package:currency_app/src/core/routes/router_config.dart";
import "package:currency_app/src/feature/settings/inherited_theme_notifier.dart";
import "package:currency_app/src/feature/settings/theme_controller.dart";
import "package:flutter/material.dart";

final ThemeController themeController = ThemeController();

class AppMaterialContext extends StatelessWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) => InheritedThemeNotifier(
        themeController: themeController,
        child: Builder(
          builder: (context) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: InheritedThemeNotifier.maybeOf(context)?.theme,
            routerConfig: RouterConfigService.router,
          ),
        ),
      );
}
