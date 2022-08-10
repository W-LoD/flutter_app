import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/data_work_bloc.dart';
import 'login_screen.dart';
import '../widgets/widgets.dart';
import '../models/person.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<DataWorkCubit, DataWorkState>(
        builder: (context, state) {
          return SafeArea(
            child: LayoutBuilder(builder: (context, constraint) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15),
                              child:Text(
                                'Регистрация',
                                style: AppTypography.font24,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                                controller: nameController,
                                style: AppTypography.font14,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.people),
                                  hintText: "Введите имя",
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                                controller: loginController,
                                style: AppTypography.font14,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.login),
                                  hintText: "Введите логин",
                                  helperText: "Логин используется для входа в систему",
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                                controller: passController,
                                style: AppTypography.font14,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  icon: Icon(Icons.lock),
                                  hintText: "Введите пароль",
                                  helperText: "Пароль используется для входа в систему",
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child:ElevatedButton(
                                onPressed:() {
                                  DateTime now = DateTime.now();
                                  String convertedDateTime = "${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";
                                  var personObject = Person(
                                    nameController.text.toString(),
                                    loginController.text.toString(),
                                    passController.text.toString(),
                                    convertedDateTime,
                                  );
                                  context.read<DataWorkCubit>().setData(personObject);
                                  print(state);
                                  if (_formKey.currentState!.validate()) {
                                    debugPrint("Details are validated!!");
                                    debugPrint("Login: ${loginController.text}");
                                    debugPrint("Name: ${nameController.text}");
                                    debugPrint("Password: ${passController.text}");
                                    debugPrint("Date: ${convertedDateTime}");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("You're sucsefully registered!"),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                ),
                                child: Text('Создать аккаунт',
                                    style: AppTypography.font16)),
                          ),

                          Text(
                            'Уже есть аккаунт?',
                            style: AppTypography.font14,
                          ),
                          GestureDetector(
                            onTap: (() {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) => const LoginScreen()),
                                ),
                              );
                            }),
                            child: Text(
                              'Войти',
                              style: AppTypography.font_14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
    )
    );
  }
}
