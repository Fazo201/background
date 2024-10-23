import "package:currency_app/src/core/widget/app_material_context.dart";
import "package:currency_app/src/core/widget/custom_screen_util.dart";
import "package:currency_app/src/data/repository/app_repository_impl.dart";
import "package:currency_app/src/feature/home/cubit/home_cubit.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class App extends StatelessWidget {
  const App({super.key});

  static void run() => runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>(
              create: (context) => HomeCubit(AppRepoImpl()),   
            ),
          ],
          child: const App(),
        ),
      );

  @override
  Widget build(BuildContext context) => const CustomScreenUtil(
        enabledPreview: false,
        child: AppMaterialContext(),
      );
}
