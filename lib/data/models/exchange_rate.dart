class ExchangeRate {
  String? time;
  String? assetIdBase;
  String? assetIdQuote;
  double? rate;

  ExchangeRate({required this.time, required this.assetIdBase, required this.assetIdQuote, required this.rate});

  ExchangeRate.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    assetIdBase = json['asset_id_base'];
    assetIdQuote = json['asset_id_quote'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['asset_id_base'] = assetIdBase;
    data['asset_id_quote'] = assetIdQuote;
    data['rate'] = rate;
    return data;
  }
}
