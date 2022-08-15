import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/data_work_bloc.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool check = true;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider<DataWorkCubit>(
            create: (context) => DataWorkCubit(),
            lazy: false,
            child: MaterialApp(
              home: BlocBuilder<DataWorkCubit, LocalStorageState>(
                builder: (BuildContext context, LocalStorageState state) {
                  if (check) context.read<DataWorkCubit>().logOrNot();
                  check = false;
                  if (state is CheckedState) {
                    return const MainScreen();
                  }
                  if (state is LoadedState) {
                    return const MainScreen();
                  }
                  if (state is NotLoadedState) {
                    return const LoginScreen();
                  }
                  if (state is NotCheckedState) {
                    return const RegistrationScreen();
                  }
                  return const RegistrationScreen();
                },
              ),
            ));
      },
    );
  }
}
