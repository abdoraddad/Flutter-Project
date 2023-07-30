import 'package:flutter/material.dart';
import 'package:flutterloginpage/model/usermodel2.dart';
import 'package:flutterloginpage/services/userservice2.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<UserModel2> user = [];
  bool isLoading = true;
  getUsersFromApi() async{
    user = await UserService().getUsers();
    isLoading = false;
    setState(() {});
  }  @override

  void initstate(){
    super.initState();
    getUsersFromApi();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading ? const Center(child:CircularProgressIndicator(),):ListView.builder(
        itemCount: user.length,
        itemBuilder: (BuildContext, int index){
          return ListTile(title: Text(user[index].title?? "--"),);
        },
      ),
    );
  }
}
