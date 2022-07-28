import 'package:flutter/material.dart';
import 'package:flutter_app/screens/NameDate.dart';
import '../authoriz/data_work.dart';
import '../models/person.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var personObject = Person('1', '2', '3', '4');
  @override
  Widget build(BuildContext context) {

    readData(personObject);
    List<Widget> widgetOptions = <Widget> [
      const NameDate(),
      ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Имя: ${personObject.name}', style: AppTypography.font24),
                    Text('Дата регистрации: ${personObject.date}', style: AppTypography.font24)
                  ],
                )
            );
          }
      ),
    ];
    void _onItemTap(int index){
      setState(() {
        _selectedIndex = index;
          debugPrint("Login2: ${personObject.login}");
          debugPrint("Password2: ${personObject.pass}");
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.garage),
              label: 'Not a Home',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        )
    );
  }
}

