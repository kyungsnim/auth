import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auth/user.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  Uri url = Uri.parse("http://localhost:8080/register");

  Future save() async {
    var res = await http.post(url, headers: {
      "Content-Type": "application/json"
    },
    body: json.encode({
      'email': user.email,
      'password': user.password
    }));
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(233, 65, 82, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Register',
                    style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
                      style: GoogleFonts.roboto(
                        // fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: const Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller : TextEditingController(
                      text: user.email,
                    ),
                    onChanged: (value) {
                      user.email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email is empty';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
                  ),
                  Container(
                    height: 5,
                    color: Colors.white.withOpacity(0.4),
                  ),
                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.roboto(
                        // fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: const Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller : TextEditingController(
                      text: user.password,
                    ),
                    onChanged: (value) {
                      user.password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password is empty';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
                  ),
                  Container(
                    height: 5,
                    color: Colors.white.withOpacity(0.4),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Already have Account?',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          save();
                        }
                      },
                      child: const Icon(Icons.arrow_forward,
                      size: 40,),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
