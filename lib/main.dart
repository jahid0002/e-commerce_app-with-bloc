import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online/bloc/home/home_bloc.dart';
import 'package:online/bloc/login/login_bloc.dart';
import 'package:online/bloc/nav_bar/navbar_bloc.dart';
import 'package:online/bloc/sign_up/signin_bloc.dart';
import 'package:online/bloc/wish_list/wish_list_bloc.dart';
import 'package:online/firebase_options.dart';
import 'package:online/screans/login_signup_page.dart/spalash_screans.dart';
import 'package:online/service/home_service/product_service.dart';
import 'package:online/utilsh/color.dart';
import 'package:online/utilsh/text_theme.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

void main() async{  

  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 await PersistentShoppingCart().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarBloc(),
        ), 
         BlocProvider(
          create: (context) => HomeBloc(ProductService()),
        ), 
          BlocProvider(
          create: (context) => SignInBloc(),
        ), 
         BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => WishListBloc(ProductService()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online-Shopping',
        theme: ThemeData(
            scaffoldBackgroundColor: AppColor.whiteColor,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColor.backgroundColor),
            useMaterial3: true,
            textTheme: CustomTextTheme.textTheme,
            appBarTheme: CustomTextTheme.appBarTheme),
        home: const SpalashPage(),
      ),
    );
  }
}
