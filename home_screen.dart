import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String? name;

  const HomePage({super.key,this.name});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  var email;
  getPref()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString("Email");
    print(email);
  }
  void initstate(){
    getPref();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {   Navigator.pop(context);
          },

        ),
        title: const Text('HomePage'),

      ),
       body: Center(
         child: Text(

           widget.name.toString(),
           style: const TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 30.0,
           ),
         ),
       //   child: ElevatedButton(
       //   onPressed: () {
       //     Navigator.pop(context);
       //  },
       //   child: const Text('Go back!'),
       // ),
       ),
    );
  }
}