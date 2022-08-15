class LoginModel {
  late bool status;
  late String message;

  Data? data;
  //List<Data> data = <Data>[];

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
   // data = json['data'] != null ? Data.fromJson(json['data']) : null;
 //if (json['data'] != null) {
 //  json['data'].forEach((jsonObjectMap) {
 //    data.add(Data.fromJson(jsonObjectMap));
 //  });
 //}
  }
}

class Data {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
