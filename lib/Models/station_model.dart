


class Station {

  String? stationName;
  String? time;
  String? imageUrl;
  String? orderState;
  String? price;
  String? distance;
  String? address;
  String? discription;

  Station({this.stationName, this.distance, this.imageUrl, this.time, this.orderState, this.price, this.address, this.discription});

  Station.fromJson(Map<String, dynamic> json) {
    stationName = json['stationName'];
    time = json['time'];
    imageUrl = json['imageUrl'];
    orderState = json['orderState'];
    price = json['price'];
    distance = json['distance'];
    address = json['address'];
    discription = json['discription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stationName'] = this.stationName;
    data['time'] = this.time;
    data['imageUrl'] = this.time;
    data['orderState'] = this.orderState;
    data['price'] = this.price;
    data['distance'] = this.time;
    data['address'] = this.time;
    data['discription'] = this.time;
    return data;
  }
}
