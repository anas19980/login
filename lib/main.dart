import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zz/widgets/button_widget.dart';
import 'package:zz/widgets/textform_widget.dart';
import 'package:zz/widgets/textfrompassword_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));

    emailController.text = "";
    passwordController.text = "";
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 185, 185),
      body: SafeArea(
        
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildHeader(),
                  TextFormWidget(
                    text: 'Username',
                    readOnly: false,
                    controller: emailController,
                    type: TextInputType.text,
                    inputFormat: [],
                  ),
                  const SizedBox(height: 12),
                  TextFormPasswordWidget(
                    text: 'Password',
                    controller: passwordController,
                    hidePassword: hidePassword,
                    icon: IconButton(
                      icon: hidePassword
                          ? const Icon(
                              Icons.visibility_outlined,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                            ),
                      onPressed: () => setState(() {
                        hidePassword = !hidePassword;
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(
                    label: 'เข้าสู่ระบบ',
                    color: Colors.blue,
                    onPressed: () => navigateToSecondPage(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() => Column(
        children: [
          Image.asset(
            'assets/welcome.jpg',
            height: 130,
          ),
          const Text(
            'ยินดีตอนรับ',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 8, 10, 9)),
          ),
          const SizedBox(
            height: 10,
          ),
          
          const SizedBox(
            height: 20,
          ),
        ],
      );

  void navigateToSecondPage() {
    final email = emailController.text.toString().trim();
    final password = passwordController.text.toString().trim();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(email: email, password: password),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String email;
  final String password;

  const SecondPage({required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 162, 162),
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: $email'),
            Text('Password: $password'),
          ],
        ),
      ),
    );
  }
}
