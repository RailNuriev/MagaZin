import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late String _registeredEmail;
  late String _registeredPassword;
  String _errorMessage = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    _registeredEmail = args['email']!;
    _registeredPassword = args['password']!;
  }

  void _login() {
    if (_emailController.text == _registeredEmail && _passwordController.text == _registeredPassword) {
      Navigator.pushNamed(context, '/home', arguments: {
        'name': (ModalRoute.of(context)!.settings.arguments as Map<String, String>)['name']!,
      });
    } else {
      setState(() {
        _errorMessage = 'Неверный email или пароль';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Авторизация',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Электронная почта'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Пароль'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Войти'),
              ),
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registration');
                },
                child: Text('Назад к регистрации'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
