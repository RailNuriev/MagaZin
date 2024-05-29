import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final name = args != null && args['name'] is String ? args['name'] : 'Unknown';

    return Scaffold(
      appBar: AppBar(
        title: Text('Личный кабинет'),
      ),
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
                'Имя: $name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 10),
                  Text(
                    'Дата рождения:',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Введите вашу дату рождения',
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Text(
                    'Номер телефона:',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Введите ваш номер телефона',
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 10),
                  Text(
                    'Адрес:',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Введите ваш адрес',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
