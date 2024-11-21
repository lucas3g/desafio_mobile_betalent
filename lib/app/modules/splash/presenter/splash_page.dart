import 'package:desafio_mobile_betalent/app/core/domain/entities/app_assets.dart';
import 'package:desafio_mobile_betalent/app/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: Center(
        child: Image.asset(
          AppAssets.logo,
        ),
      ),
    );
  }
}
