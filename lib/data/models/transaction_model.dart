class TransactionModel {
  final String id;
  final String type;
  final String? asset;
  final String? network;
  final num amount;
  final double? price;
  final String? phone;
  final String date;

  const TransactionModel({
    required this.id,
    required this.type,
    this.asset,
    this.network,
    required this.amount,
    this.price,
    this.phone,
    required this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json["id"],
      type: json["type"],
      asset: json["asset"],
      network: json["network"],
      amount: json["amount"],
      price: json["price"],
      phone: json["phone"],
      date: json["date"],
    );
  }

  Map<String, dynamic> json() => {
    "id": id,
    "type": type,
    "asset": asset,
    "amount": amount,
    "price": price,
    "date": date,
  };
}
