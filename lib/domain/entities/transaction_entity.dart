class TransactionEntity {
  final String id;
  final String type;
  final String? asset;
  final String? network;
  final num amount;
  final double? price;
  final String? phone;
  final String date;

  const TransactionEntity({
    required this.id,
    required this.type,
    this.asset,
    this.network,
    required this.amount,
    this.price,
    this.phone,
    required this.date,
  });
}
