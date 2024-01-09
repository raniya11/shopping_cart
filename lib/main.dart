

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/core/services/theme_services.dart';
import 'package:shopping_cart_app/core/theme.dart';
import 'package:shopping_cart_app/features/view/product_listview.dart';
import 'package:shopping_cart_app/features/viewmodels/product_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ThemeServiceProvider()),
        ChangeNotifierProvider(create: (context)=>ProductViewModel()),
      ],
      child: const MyApp(),
    )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(builder: (context,themeprovider,child){
      return MaterialApp(
        initialRoute: "/",
        routes: {
          "/":(context)=>HomePage(),
        },
        title: 'User Management',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeprovider.isDarkModeOn?ThemeMode.dark:ThemeMode.light,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}


