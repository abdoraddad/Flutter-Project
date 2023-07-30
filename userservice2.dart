// ignore: file_names
import 'package:dio/dio.dart';
import 'package:flutterloginpage/model/usermodel2.dart';

class UserService {
  String url= "https://jsonplaceholder.typicode.com/users";

  Future<List<UserModel2>> getUsers() async{
    List<UserModel2> users = [];
    Response response = await Dio().get(url);
    var data =response.data;
    data.forEach((element){
        UserModel2 user =UserModel2.fromJson(element);
        users.add(user);
    });
    return users;
  }
}
