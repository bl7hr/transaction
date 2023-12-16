class DestinationModel {
  int? id;
  String? name;
  int? distance;

  DestinationModel({this.id, this.name, this.distance});

  DestinationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['distance'] = this.distance;
    return data;
  }
}
