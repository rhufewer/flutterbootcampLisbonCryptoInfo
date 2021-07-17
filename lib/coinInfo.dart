// To parse this JSON data, do
//
//     final coinInfo = coinInfoFromJson(jsonString);
// thanks to https://app.quicktype.io/

import 'dart:convert';

CoinInfo coinInfoFromJson(String str) => CoinInfo.fromJson(json.decode(str));

String coinInfoToJson(CoinInfo data) => json.encode(data.toJson());

class CoinInfo {
  CoinInfo({
    this.id,
    this.symbol,
    this.name,
    this.assetPlatformId,
    this.platforms,
    this.blockTimeInMinutes,
    this.hashingAlgorithm,
    this.categories,
    this.publicNotice,
    this.additionalNotices,
    this.description,
    this.links,
    this.image,
    this.countryOrigin,
    this.genesisDate,
    this.contractAddress,
    this.sentimentVotesUpPercentage,
    this.sentimentVotesDownPercentage,
    this.marketCapRank,
    this.coingeckoRank,
    this.coingeckoScore,
    this.developerScore,
    this.communityScore,
    this.liquidityScore,
    this.publicInterestScore,
    this.publicInterestStats,
    this.statusUpdates,
    this.lastUpdated,
  });

  String? id;
  String? symbol;
  String? name;
  String? assetPlatformId;
  Platforms? platforms;
  int? blockTimeInMinutes;
  dynamic hashingAlgorithm;
  List<dynamic>? categories;
  dynamic publicNotice;
  List<dynamic>? additionalNotices;
  Description? description;
  Links? links;
  ImageCoin? image;
  String? countryOrigin;
  dynamic genesisDate;
  String? contractAddress;
  double? sentimentVotesUpPercentage;
  double? sentimentVotesDownPercentage;
  int? marketCapRank;
  int? coingeckoRank;
  double? coingeckoScore;
  double? developerScore;
  double? communityScore;
  double? liquidityScore;
  double? publicInterestScore;
  PublicInterestStats? publicInterestStats;
  List<dynamic>? statusUpdates;
  DateTime? lastUpdated;

  factory CoinInfo.fromJson(Map<String, dynamic> json) => CoinInfo(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        assetPlatformId: json["asset_platform_id"],
        platforms: Platforms.fromJson(json["platforms"]),
        blockTimeInMinutes: json["block_time_in_minutes"],
        hashingAlgorithm: json["hashing_algorithm"],
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        publicNotice: json["public_notice"],
        additionalNotices:
            List<dynamic>.from(json["additional_notices"].map((x) => x)),
        description: Description.fromJson(json["description"]),
        links: Links.fromJson(json["links"]),
        image: ImageCoin.fromJson(json["image"]),
        countryOrigin: json["country_origin"],
        genesisDate: json["genesis_date"],
        contractAddress: json["contract_address"],
        sentimentVotesUpPercentage:
            json["sentiment_votes_up_percentage"].toDouble(),
        sentimentVotesDownPercentage:
            json["sentiment_votes_down_percentage"].toDouble(),
        marketCapRank: json["market_cap_rank"],
        coingeckoRank: json["coingecko_rank"],
        coingeckoScore: json["coingecko_score"].toDouble(),
        developerScore: json["developer_score"].toDouble(),
        communityScore: json["community_score"].toDouble(),
        liquidityScore: json["liquidity_score"].toDouble(),
        publicInterestScore: json["public_interest_score"].toDouble(),
        publicInterestStats:
            PublicInterestStats.fromJson(json["public_interest_stats"]),
        statusUpdates: List<dynamic>.from(json["status_updates"].map((x) => x)),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "asset_platform_id": assetPlatformId,
        "platforms": platforms!.toJson(),
        "block_time_in_minutes": blockTimeInMinutes,
        "hashing_algorithm": hashingAlgorithm,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "public_notice": publicNotice,
        "additional_notices":
            List<dynamic>.from(additionalNotices!.map((x) => x)),
        "description": description!.toJson(),
        "links": links!.toJson(),
        "image": image!.toJson(),
        "country_origin": countryOrigin,
        "genesis_date": genesisDate,
        "contract_address": contractAddress,
        "sentiment_votes_up_percentage": sentimentVotesUpPercentage,
        "sentiment_votes_down_percentage": sentimentVotesDownPercentage,
        "market_cap_rank": marketCapRank,
        "coingecko_rank": coingeckoRank,
        "coingecko_score": coingeckoScore,
        "developer_score": developerScore,
        "community_score": communityScore,
        "liquidity_score": liquidityScore,
        "public_interest_score": publicInterestScore,
        "public_interest_stats": publicInterestStats!.toJson(),
        "status_updates": List<dynamic>.from(statusUpdates!.map((x) => x)),
        "last_updated": lastUpdated!.toIso8601String(),
      };
}

class Description {
  Description({
    this.en,
  });

  String? en;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class ImageCoin {
  ImageCoin({
    this.thumb,
    this.small,
    this.large,
  });

  String? thumb;
  String? small;
  String? large;

  factory ImageCoin.fromJson(Map<String, dynamic> json) => ImageCoin(
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "small": small,
        "large": large,
      };
}

class Links {
  Links({
    this.homepage,
    this.blockchainSite,
    this.officialForumUrl,
    this.chatUrl,
    this.announcementUrl,
    this.twitterScreenName,
    this.facebookUsername,
    this.bitcointalkThreadIdentifier,
    this.telegramChannelIdentifier,
    this.subredditUrl,
    this.reposUrl,
  });

  List<String>? homepage;
  List<String>? blockchainSite;
  List<String>? officialForumUrl;
  List<String>? chatUrl;
  List<String>? announcementUrl;
  String? twitterScreenName;
  String? facebookUsername;
  dynamic bitcointalkThreadIdentifier;
  String? telegramChannelIdentifier;
  String? subredditUrl;
  ReposUrl? reposUrl;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: List<String>.from(json["homepage"].map((x) => x)),
        blockchainSite:
            List<String>.from(json["blockchain_site"].map((x) => x)),
        officialForumUrl:
            List<String>.from(json["official_forum_url"].map((x) => x)),
        chatUrl: List<String>.from(json["chat_url"].map((x) => x)),
        announcementUrl:
            List<String>.from(json["announcement_url"].map((x) => x)),
        twitterScreenName: json["twitter_screen_name"],
        facebookUsername: json["facebook_username"],
        bitcointalkThreadIdentifier: json["bitcointalk_thread_identifier"],
        telegramChannelIdentifier: json["telegram_channel_identifier"],
        subredditUrl: json["subreddit_url"],
        reposUrl: ReposUrl.fromJson(json["repos_url"]),
      );

  Map<String, dynamic> toJson() => {
        "homepage": List<dynamic>.from(homepage!.map((x) => x)),
        "blockchain_site": List<dynamic>.from(blockchainSite!.map((x) => x)),
        "official_forum_url":
            List<dynamic>.from(officialForumUrl!.map((x) => x)),
        "chat_url": List<dynamic>.from(chatUrl!.map((x) => x)),
        "announcement_url": List<dynamic>.from(announcementUrl!.map((x) => x)),
        "twitter_screen_name": twitterScreenName,
        "facebook_username": facebookUsername,
        "bitcointalk_thread_identifier": bitcointalkThreadIdentifier,
        "telegram_channel_identifier": telegramChannelIdentifier,
        "subreddit_url": subredditUrl,
        "repos_url": reposUrl!.toJson(),
      };
}

class ReposUrl {
  ReposUrl({
    this.github,
    this.bitbucket,
  });

  List<dynamic>? github;
  List<dynamic>? bitbucket;

  factory ReposUrl.fromJson(Map<String, dynamic> json) => ReposUrl(
        github: List<dynamic>.from(json["github"].map((x) => x)),
        bitbucket: List<dynamic>.from(json["bitbucket"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "github": List<dynamic>.from(github!.map((x) => x)),
        "bitbucket": List<dynamic>.from(bitbucket!.map((x) => x)),
      };
}

class Platforms {
  Platforms({
    this.ethereum,
  });

  String? ethereum;

  factory Platforms.fromJson(Map<String, dynamic> json) => Platforms(
        ethereum: json["ethereum"],
      );

  Map<String, dynamic> toJson() => {
        "ethereum": ethereum,
      };
}

class PublicInterestStats {
  PublicInterestStats({
    this.alexaRank,
    this.bingMatches,
  });

  dynamic alexaRank;
  dynamic bingMatches;

  factory PublicInterestStats.fromJson(Map<String, dynamic> json) =>
      PublicInterestStats(
        alexaRank: json["alexa_rank"],
        bingMatches: json["bing_matches"],
      );

  Map<String, dynamic> toJson() => {
        "alexa_rank": alexaRank,
        "bing_matches": bingMatches,
      };
}
