// ignore_for_file: avoid_print

import 'package:contract_app/features/other/presentation/bloc/phone_list_cubit/phone_list_cubit.dart';
import 'package:contract_app/locator_service.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/common/app_colors.dart';
import 'features/other/presentation/pages/splash.dart';
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
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            backgroundColor: AppColors.mainBackground,
          ),
          home: const Splash(),
        ));
  }
}
