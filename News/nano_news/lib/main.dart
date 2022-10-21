import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_news/spash_screen_widget.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:nano_news/utility/dependency_assembly.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpdependencyAssembly();
  runApp(
    ProviderScope(
      child: BaseViewWidget(),
    ),
  );
}

class BaseViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nano News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppTheme.fontName,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenWidget(),
    );
  }
}
