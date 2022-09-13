class Price {
  String? type;
  num? price;

  Price({
    this.type,
    this.price,
  });

  Price.fromJson(Map<String, dynamic> json) {
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    return data;
  }
}
