import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterloginpage/widgets/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  var email;
  final _formKey = GlobalKey<FormState>();
  final emaill = TextEditingController();

  savePref(String email)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('Email', email);
    print(preferences.getString("Email"));
  }



  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
      child: Form(
      key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40,),
            const Center(
              child: Image(
                height: 250,
                width: 250,
                image: AssetImage("assets/flutter.png"),
              ),
            ),
            const SizedBox(height: 50,),

            TextFormField(
              controller: emaill,
              decoration: const InputDecoration
                (
                  labelText: "email",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,

                  )
              ),
              validator: (value) {
                if ( value!.isNotEmpty && value.contains('@')) {
                  return null;
                }
                else{return 'Please enter Valid Email';}

              },
            ),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: const InputDecoration
                (
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,

                  )
              ),
              validator: (value) {
                if (value == null || value.length<8) {
                  return 'Please enter Valid Password';
                }
                return null;
              },
            ),
            const SizedBox(height: 30,),
        
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(14),
              ),

              child: ElevatedButton(

                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logged in')),
                    );
                    savePref(emaill.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomePage(
                        name: emaill.text
                    )),
                  );
                  }
                },
                child: const Text(

                  'Login',
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text(
              "Forgot Password? No yawa. Tap me",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15
              ),
            ),
            const SizedBox(height: 45,),
            Container(

              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(14),
              ),

              child: MaterialButton(

                onPressed: (){},
                child: const Text(

                  'No Account? Sign Up',
                  style: TextStyle(color: CupertinoColors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

