class WalletModel {
  final double balance;
  final String currency;

  const WalletModel({required this.balance, required this.currency});

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(balance: json["balance"], currency: json["currency"]);
  }

  Map<String, dynamic> json() => {"balance": balance, "currency": currency};
}
