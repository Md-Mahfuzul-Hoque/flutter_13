import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'forget_password_verify_otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _signUpInProgress = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Text('Join With Us',
                    style:Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: 'Email'
                    ),
                    validator: (String ? value){
                      if(value == null || value.isEmpty){
                        return ' Please  enter your email';
                      }
                      
                      final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              
                      if(!emailRegExp.hasMatch(value)){
                        return 'Please enter valid email';
                      }
                      return null;
                      
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        hintText: 'First Name'
                    ),
                    validator: (String ? value){
                      if(value == null || value.isEmpty) {
                        return ' Please  enter your first name';
                      }
              
                      //regExp Korty hobe
                      if(value.trim().length <2){
                        return ' first name must be at least 2 char';
                      }
              
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                        hintText: 'Last Name'
                    ),
                    validator: (String ? value){
                      if(value == null || value.isEmpty) {
                        return ' Please  enter your last name';
                      }
              
                      //regExp Korty hobe
                      if(value.trim().length <2){
                        return ' last name must be at least 2 char';
                      }
              
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                        hintText: 'Mobile'
                    ),
                    validator: (String ? value){
                      if(value == null || value.isEmpty) {
                        return ' Please  enter your mobile number';
                      }
              
                      //regExp Korty hobe
                      if(value.trim().length != 11){
                        return 'Enter valid phone number';
                      }
              
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: 'Password'
                    ),
                    obscureText: true,
                    validator: (String ? value){
                      if(value == null || value.isEmpty) {
                        return ' Please  enter your password';
                      }
              
                      //regExp Korty hobe
                      if(value.length <=8){
                        return 'Enter password more then 6';
                      }
              
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: !_signUpInProgress,
                    replacement: Center(
                        child: CircularProgressIndicator()),
                    child: FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()){
                            _signUp();
                          }
                        },
                        child: Icon(Icons.arrow_circle_right_outlined)),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "already have an account ?",
                            children: [
                              TextSpan(
                                  text: 'Sign in',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                              ),
                            ],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _clearTextField(){
    _emailController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _mobileController.clear();
    _passwordController.clear();
  }

  Future<void> _signUp()async {
    setState(() {
      _signUpInProgress = true;
    });
    Map<String,dynamic>requestBody = {
      "email":_emailController.text,
      "firstName":_firstNameController.text,
      "lastName":_lastNameController.text,
      "mobile":_mobileController.text,
      "password":_passwordController.text,
    };

    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody,
    );
    setState(() {
      _signUpInProgress = false;
    });

    if(response.isSuccess){
      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign Up success..!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }else{

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.responseData['data']),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }

  }


  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
