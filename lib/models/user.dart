import 'package:flutter/material.dart';

class UserState extends State<User> {
  String name = '';
  String birthDate = '';
  String phone = '';
  String address = '';

  void setName(String newName) {
    setState(() {
      name = newName;
    });
  }

  void setBirthDate(String newBirthDate) {
    setState(() {
      birthDate = newBirthDate;
    });
  }

  void setPhone(String newPhone) {
    setState(() {
      phone = newPhone;
    });
  }

  void setAddress(String newAddress) {
    setState(() {
      address = newAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class User extends StatefulWidget {
  @override
  UserState createState() => UserState();
}
