import 'package:flutter/material.dart';
import 'package:test_app/modules/messenger/messenger_screen.dart';
import 'package:test_app/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailcontrollar = TextEditingController();
  var passwordcontrollar = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defualtTextFormField(
                      controller: emailcontrollar,
                      type: TextInputType.emailAddress,
                      validate: (value){
                        if(value.toString().isEmpty){
                          return 'Email Address Must Not Be Empty';
                        }
                        return null;
                      },
                      label: 'Email Address',
                      prefixIcon: Icons.email),
                  SizedBox(
                    height: 15.0,
                  ),
                  defualtTextFormField(
                    controller: passwordcontrollar,
                      type: TextInputType.visiblePassword,
                      validate: (value){
                        if(value.toString().isEmpty){
                          return 'Password Must Be Not Empty';
                        }
                        return null;
                      },
                      label: 'Password',
                      prefixIcon: Icons.lock,
                    suffixIcon: IconButton(icon: Icon(isPassword?Icons.remove_red_eye:Icons.visibility_off),
                    onPressed: (){
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },),
                    isPassword: isPassword,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defualtButton(
                    text: 'login',
                    function: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MessengerScreen()));
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defualtButton(
                      function: () {
                        print("reg");
                      },
                      text: 'ReGiSTER',
                      background: Colors.red),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t Have An Account? || '),
                      TextButton(onPressed: () {}, child: Text('Regester Now'))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
