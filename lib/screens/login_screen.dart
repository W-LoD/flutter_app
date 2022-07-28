import 'package:flutter/material.dart';
import '../authoriz/data_work.dart';
import '../screens/registration_screen.dart';
import '../widgets/widgets.dart';
import '../models/person.dart';

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
    var personObject =  Person('1', '2', '3', '4');
    readData(personObject);
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: SafeArea(
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
                          padding: const EdgeInsets.all(15),
                          child:ElevatedButton(
                              onPressed:() {
                                 if (_formKey.currentState!.validate()) {
                                   debugPrint("Details are validated!!");
                                   debugPrint("Login1: ${loginController.text}");
                                   debugPrint("Password1: ${passController.text}");
                                   debugPrint("Login2: ${personObject.login}");
                                   debugPrint("Password2: ${personObject.pass}");
                                 }
                                if(loginController.text == personObject.login &&
                                   passController.text == personObject.pass) {
                                  Navigator.pushNamed(context, '/MS');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              ),
                              child: Text('Войти',
                                  style: AppTypography.font16)),
                        ),),
                      Text(
                        'Ещё нет аккаунта?',
                        style: AppTypography.font14,
                      ),
                      GestureDetector(
                        onTap: (() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => const RegistrationScreen()),
                            ),
                          );
                        }),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                            child: Text(
                              'Зарегистрироваться',
                              style: AppTypography.font_14,
                        ),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
