import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bwa_projects1/cubit/auth_cubit.dart';
import 'package:flutter_bwa_projects1/cubit/destination_cubit.dart';
import 'package:flutter_bwa_projects1/cubit/page_cubit.dart';
import 'package:flutter_bwa_projects1/cubit/seat_cubit.dart';
import 'package:flutter_bwa_projects1/ui/pages/bonus_page.dart';
import 'package:flutter_bwa_projects1/ui/pages/get_started_page.dart';
import 'package:flutter_bwa_projects1/ui/pages/main_page.dart';
import 'package:flutter_bwa_projects1/ui/pages/sign_in_page.dart';
import 'package:flutter_bwa_projects1/ui/pages/sign_up_page.dart';
import 'package:flutter_bwa_projects1/ui/pages/splash_page.dart';
import 'package:flutter_bwa_projects1/ui/pages/success_checkout.dart';

import 'cubit/transaction_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/success': (context) => SuccessCheckoutPage(),
        },
      ),
    );
  }
}
