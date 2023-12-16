class OrderModel {
  int? id;
  String? goodsType;
  String? traderName;
  int? userId;
  String? userName;
  int? driverId;
  String? driverName;
  String? driverNumber;
  int? destId;
  String? destName;
  int? distance;
  String? orderDate;
  String? note;

  OrderModel(
      {this.id,
        this.goodsType,
        this.traderName,
        this.userId,
        this.userName,
        this.driverId,
        this.driverName,
        this.driverNumber,
        this.destId,
        this.destName,
        this.distance,
        this.orderDate,
        this.note});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsType = json['goods_type'];
    traderName = json['trader_name'];
    userId = json['user_id'];
    userName = json['user_name'];
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    driverNumber = json['driver_number'];
    destId = json['dest_id'];
    destName = json['dest_name'];
    distance = json['distance'];
    orderDate = json['order_date'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goods_type'] = this.goodsType;
    data['trader_name'] = this.traderName;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['driver_id'] = this.driverId;
    data['driver_name'] = this.driverName;
    data['driver_number'] = this.driverNumber;
    data['dest_id'] = this.destId;
    data['dest_name'] = this.destName;
    data['distance'] = this.distance;
    data['order_date'] = this.orderDate;
    data['note'] = this.note;
    return data;
  }
}
