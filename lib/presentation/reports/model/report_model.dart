class ReportModel {
  int? driverId;
  String? driverName;
  String? userName;
  int? ordersCount;
  int? totalDistance;

  ReportModel(
      {this.driverId,
        this.driverName,
        this.userName,
        this.ordersCount,
        this.totalDistance});

  ReportModel.fromJson(Map<String, dynamic> json) {
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    userName = json['user_name'];
    ordersCount = json['orders_count'];
    totalDistance = json['total_distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driver_id'] = this.driverId;
    data['driver_name'] = this.driverName;
    data['user_name'] = this.userName;
    data['orders_count'] = this.ordersCount;
    data['total_distance'] = this.totalDistance;
    return data;
  }
}
