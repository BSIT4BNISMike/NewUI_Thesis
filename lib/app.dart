import 'package:flutter/material.dart';
import 'package:befit/for_test.dart';
import 'package:befit/screens/splash.dart';
import 'package:befit/standards.dart';

class BeFit extends StatelessWidget {
  // Additional
  const BeFit({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Additional
      debugShowCheckedModeBanner: false,
      title: 'BeFit',
      theme: _BeFitTheme,
      initialRoute: '/setup',
      routes: {
        // '/test': (context) => Splash(),
        '/setup': (context) => Splash(),
      },
    );
  }
}

final ThemeData _BeFitTheme = _buildBeFitTheme();

ThemeData _buildBeFitTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Standards.colors["primaryColor"],
    scaffoldBackgroundColor: Standards.colors["backColor"],
    appBarTheme: _buildAppBarTheme(base.appBarTheme),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      primaryColorDark: Standards.colors["primaryColorDark"],
      accentColor: Standards.colors["primaryColorLight"],
    ),
  );
}

AppBarTheme _buildAppBarTheme(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: Standards.colors["backColor"],
    toolbarTextStyle: Standards.fontStyles["main"],
    elevation: 0,
    centerTitle: true,
  );
}
