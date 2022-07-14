import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hub/providers/api_service.dart';
import 'package:recipe_hub/utils/colors.dart';
import 'package:recipe_hub/utils/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataApi(),
        ),
      ],
      child: MaterialApp(
        title: 'Recipe Hub',
        theme: ThemeData(
          primarySwatch: primaryGreen,
          useMaterial3: true,
        ),
        routes: routes,
        initialRoute: 'check_auth',
      ),
    );
  }
}
