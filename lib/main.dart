import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/data_work_bloc.dart';
import'screens/login_screen.dart';
import'screens/registration_screen.dart';
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
              home: BlocBuilder<DataWorkCubit, DataWorkState>(
               builder: (BuildContext context, DataWorkState state) {

               if(check) context.read<DataWorkCubit>().isLogged();
               check = false;
               if (state is CheckedState || state is LoadedState) {
                 return MainScreen();
                }
                if (state is NotLoadedState) {
                 return LoginScreen();
                }
                if (state is NotCheckedState) {
                  return RegistrationScreen();
                }
                return RegistrationScreen();
          },
        ),
            // child: MaterialApp(
            //
            //     debugShowCheckedModeBanner: false,
            //     title: 'The App',
            //     initialRoute: '/CS',
            //     routes: {
            //      '/CS': (context) => const CheckScreen(),
            //       '/LS': (context) => const LoginScreen(),
            //       '/RS': (context) => const RegistrationScreen(),
            //       '/MS': (context) => const MainScreen()
            //     },
            )
        );
      },
    );
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../repository/data_work_repository.dart';
// import '../cubit/AuthenticationEvents.dart';
// import '../cubit/AuthenticationState.dart';
// import '../cubit/AuthenticationBloc.dart';
// import '../screens/check_screen.dart';
// import '../screens/login_page.dart';
// import '../screens/loading_indicator.dart';
// import '../screens/home_page.dart';
//
// class SimpleBlocDelegate extends BlocObserver{
//   @override
//   void onTranzition(Transition transition) {
//     print(transition.toString());
//   }
// }
//
// void main() {
//   runApp(App(userRepository: UserRepository()));
// }
//
// class App extends StatefulWidget {
//   final UserRepository userRepository;
//
//   App({required this.userRepository}) : super();
//
//   @override
//   State<App> createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//   late AuthenticationBloc authenticationBloc;
//   UserRepository get userRepository => widget.userRepository;
//
//   @override
//   void initState() {
//     authenticationBloc = AuthenticationBloc(userRepository: userRepository);
//     authenticationBloc.onEvent(AppStarted());
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     authenticationBloc.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<AuthenticationBloc>(
//       create: (_) => AuthenticationBloc(userRepository: userRepository),
//       child: MaterialApp(
//         home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
//           bloc: authenticationBloc,
//           builder: (BuildContext context, AuthenticationState state) {
//             if (state is AuthenticationUninitialized) {
//               return SplashPage();
//             }
//             if (state is AuthenticationAuthenticated) {
//               return HomePage();
//             }
//             if (state is AuthenticationUnauthenticated) {
//               return LoginPage(userRepository: userRepository);
//             }
//             if (state is AuthenticationLoading) {
//               return LoadingIndicator();
//             }
//             return SplashPage();
//           },
//         ),
//       ),
//     );
//   }
// }
