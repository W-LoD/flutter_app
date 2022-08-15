import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/person.dart';
import '../bloc/data_work_bloc.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightBlue,
        body: BlocBuilder<DataWorkCubit, LocalStorageState>(
          builder: (context, state) {
            return SafeArea(
              child: LayoutBuilder(builder: (context, constraint) {
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "../assets/images/logo_registration.jpg"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    'Вход',
                                    style: AppTypography.font24,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                    controller: loginController,
                                    style: AppTypography.font14,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      icon: Icon(Icons.login),
                                      hintText: "Введите логин",
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
                                    )),
                              ),
                              GestureDetector(
                                onTap: () async {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Person person = Person(
                                          '1',
                                          loginController.text,
                                          passController.text,
                                          '1',
                                        );
                                        context
                                            .read<DataWorkCubit>()
                                            .getDataLP(person);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 20),
                                      ),
                                      child: Text('Войти',
                                          style: AppTypography.font16)),
                                ),
                              ),
                              Text(
                                'Ещё нет аккаунта?',
                                style: AppTypography.font14,
                              ),
                              GestureDetector(
                                  onTap: (() {
                                    context.read<DataWorkCubit>().logOrNot();
                                  }),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      'Зарегистрироваться',
                                      style: AppTypography.font_14,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ));
  }
}
