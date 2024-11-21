import 'package:flutter/material.dart';

import 'core/domain/entities/named_routes.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/domain/entities/custom_transition.dart';
import 'core/routes/domain/entities/custom_transition_type.dart';
import 'shared/theme/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio BeTalent',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      initialRoute: NamedRoutes.splash.route,
      onGenerateRoute: CustomNavigator(
        generateAnimation: _generateAnimation,
      ).onGenerateRoute,
    );
  }

  CustomTransition _generateAnimation(RouteSettings settings) {
    return CustomTransition(
      transitionType: CustomTransitionType.fade,
      duration: const Duration(milliseconds: 200),
    );
  }
}
