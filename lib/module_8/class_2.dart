import 'package:flutter/material.dart';
import 'package:flutter_13/home.dart';
import 'package:flutter_13/module_8/home-2.dart';

import 'dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Image.asset('asset/YT.png', height: 250, width: 250),
          Text('Login With phone and password'),
          SizedBox(height: 20),

          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Phone Number'),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Phone Number',
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please Enter Phone Number";
                      } else if (value.length != 11) {
                        return 'Please Enter Correct Number';
                      } else {
                        return null;
                      }
                    },
                  ),

                  //password
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please Enter Password";
                      } else if (value.length <= 6) {
                        return 'Password must be at least 6 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),

                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text('Login Success')
                          //   )
                          // );
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Home()),
                          // );

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),

                  //Navigator name
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'btns');
                    },
                    child: Text('BTNS'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'home');
                    },
                    child: Text('HOME'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'Dashboard',
                        arguments: {
                          'phone': phoneController.text,
                          'name': 'Mahfuz',
                        },
                      );
                    },
                    child: Text('Dashboard'),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeTwo()),
                      );
                    },
                    child: Text('HomeTwo'),
                  ),

                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.blue,
                  //       foregroundColor: Colors.white,
                  //     ),
                  //     onPressed: (){
                  //       Navigator.pushReplacement(context,
                  //           MaterialPageRoute(builder: (context) => Dashboard(phone: phoneController.text))
                  //       );
                  //     },
                  //     child: Text('Dashboard')
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
