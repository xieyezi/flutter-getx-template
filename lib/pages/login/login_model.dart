import 'dart:convert';

UserLoginResponseModel userLoginResponseModelFromJson(String str) => UserLoginResponseModel.fromJson(json.decode(str));

String userLoginResponseModelToJson(UserLoginResponseModel data) => json.encode(data.toJson());

class UserLoginResponseModel {
  UserLoginResponseModel({
    this.token,
    this.name,
    this.id,
  });

  String? token;
  String? name;
  int? id;

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) => UserLoginResponseModel(
        token: json["token"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "id": id,
      };
}
