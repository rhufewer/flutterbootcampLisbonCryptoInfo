class Coin {
  String? id;
  int? coinId;
  String? name;
  String? thumbnail;
  String? image;
  String? symbol;
  int? marketCapRank;
  String? smallImg;
  String? slug;
  int? score;

  double? price;

  Coin.forJson(
      {this.id,
      this.coinId,
      this.name,
      this.thumbnail,
      this.image,
      this.symbol,
      this.marketCapRank,
      this.smallImg,
      this.slug,
      this.score,
      this.price});
  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin.forJson(
        id: json["item"]['id'],
        coinId: json["item"]['coin_id'],
        name: json["item"]['name'],
        thumbnail: json["item"]['thumb'],
        image: json["item"]['large'],
        symbol: json["item"]['symbol'],
        marketCapRank: json["item"]['market_cap_rank'],
        smallImg: json["item"]['small'],
        slug: json["item"]['slug'],
        score: json["item"]['score'],
        price: json["item"]['price_btc']);
  }
}
