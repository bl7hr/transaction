class DriverModel {
  int? id;
  String? name;
  String? number;
  bool? ready;

  DriverModel({this.id, this.name, this.number, this.ready});

  DriverModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    ready = json['ready'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['ready'] = this.ready;
    return data;
  }
}