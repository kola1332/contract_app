// ignore_for_file: avoid_print

import 'package:contract_app/feature/presentation/bloc/phone_bloc/phone_bloc.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_cubit.dart';
import 'package:contract_app/feature/presentation/pages/home_page.dart';
import 'package:contract_app/locator_service.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/app_colors.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PhoneListCubit>(
              create: (context) => sl<PhoneListCubit>()..loadPhones()),
          BlocProvider<PhoneBloc>(create: (context) => sl<PhoneBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            backgroundColor: AppColors.mainBackground3,
          ),
          home: const HomePage(),
          // routes: {
          //   '/': (context) => const FirstScreen(),
          //   '/second_screen': (context) => SecondScreen(),
          //   '/cart': (context) => const Cart(),
          // },
        ));
  }
}
