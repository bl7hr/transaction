class LoginModel {
  Null? result;
  Value? value;

  LoginModel({this.result, this.value});

  LoginModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Value {
  int? id;
  Null? userName;
  String? password;
  Null? name;
  String? token;

  Value({this.id, this.userName, this.password, this.name, this.token});

  Value.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    password = json['password'];
    name = json['name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['password'] = this.password;
    data['name'] = this.name;
    data['token'] = this.token;
    return data;
  }
}
