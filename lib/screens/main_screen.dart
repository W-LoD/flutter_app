import 'package:flutter/material.dart';
import 'package:flutter_app/screens/api_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/data_work_bloc.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    context.read<DataWorkCubit>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: BlocBuilder<DataWorkCubit, LocalStorageState>(
          builder: (context, state) {
            List<Widget> widgetOptions = <Widget>[
              ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text('Имя: ${state.person!.name}',
                                    style: AppTypography.font24)),
                            Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                    'Дата регистрации: ${state.person!.date}',
                                    style: AppTypography.font24)),
                            Container(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        context.read<DataWorkCubit>().logOut();
                                      },
                                      child: const Icon(Icons.logout))),
                            )
                          ],
                        ));
                  }),
              const NameDate(),
            ];
            void _onItemTap(int index) {
              setState(() {
                _selectedIndex = index;
              });
            }

            return Scaffold(
                appBar: AppBar(
                  title: const Text("Главная страница"),
                ),
                body: Center(
                  child: widgetOptions.elementAt(_selectedIndex),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  selectedIconTheme: const IconThemeData(
                      color: AppColors.blue, opacity: 1.0, size: 45),
                  unselectedIconTheme: const IconThemeData(
                      color: AppColors.black, opacity: 0.5, size: 25),
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle), label: 'Профиль'),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.api),
                      label: 'Информация с API',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: _onItemTap,
                ));
          },
        ));
  }
}
