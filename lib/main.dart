import 'package:aplikasi_phincon/screens/forgot_password_screen.dart';
import 'package:aplikasi_phincon/screens/home_screen.dart';
import 'package:aplikasi_phincon/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'providers/checkinout_provider.dart';
import 'providers/user_provider.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider.value(
            value: UserProvider('', '', []),
          ),
          ChangeNotifierProvider.value(
            value: CheckInOutProvider('', '', []),
          ),
          // ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
          //   create: (_) => UserProvider('', '', []),
          //   update: (context, auth, usersAuth) => UserProvider(
          //     auth.token!,
          //     auth.userId!,
          //     usersAuth == null ? [] : usersAuth.users,
          //   ),
          // ),
        ],
        child: Consumer<AuthProvider>(
          builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: auth.isAuth
                ? HomeScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : LoginScreen(),
                  ),
            routes: {
              LoginScreen.routeName: (context) => const LoginScreen(),
              SignUpScreen.routeName: (context) => const SignUpScreen(),
              ForgotPassword.routeName: (context) => const ForgotPassword(),
              HomeScreen.routeName: (context) => const HomeScreen(),
            },
          ),
        ));
  }
}
