import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_app/presentation/source/bloc/source_bloc.dart';
import 'package:news_app/utils/colors_app.dart';
import 'package:news_app/utils/routers.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'inject.dart' as di;

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SourceCubit>(create: (context) => di.locator<SourceCubit>())
      ],
      child: GetMaterialApp(
        title: "News App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: ColorsApp.blackColor)
          )
        ),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        initialRoute: RouterApp.initial,
        getPages: RouterApp.routers,
      ),
    );
  }
}
