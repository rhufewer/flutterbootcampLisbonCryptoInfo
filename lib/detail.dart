import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lisbon_bootcamp/coin.dart';
import 'package:flutter_lisbon_bootcamp/coinInfo.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class CoinDetail extends StatefulWidget {
  CoinDetail({Key? key, required this.coindetail}) : super(key: key);
  final Coin coindetail;
  @override
  _CoinDetailState createState() => _CoinDetailState(this.coindetail);
}

class _CoinDetailState extends State<CoinDetail> {
  final Coin coindetail;

  _CoinDetailState(this.coindetail);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color(0xFF1b1e44),
              Color(0xFF2d3447),
            ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.clamp)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                    padding:
                        EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              coindetail.smallImg!,
                              height: 50,
                              filterQuality: FilterQuality.high,
                            ),
                            Flexible(
                                child: Container(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Text(
                                coindetail.name!,
                                style: TextStyle(
                                  fontSize: 35.0,
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(coindetail.symbol!),
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        coinInfo(coindetail.name!, coindetail.id!),
                      ],
                    )),
              ],
            ))));
  }
}

//fetch Info data from API
Future<CoinInfo> _fetchCoinInfo(String coinId) async {
  CoinInfo coininfo = new CoinInfo(); //coin info

  http.Response response; //try to get response GET

  try {
    response = await http.get(Uri.parse(
        "https://api.coingecko.com/api/v3/coins/$coinId?localization=false&tickers=false&market_data=false&community_data=true&developer_data=false&sparkline=false"));

    if (response.statusCode == HttpStatus.ok) {
      final mappingResponse = json.decode(response.body);

      coininfo = CoinInfo.fromJson(mappingResponse);
    }
  } catch (e) {
    throw Exception(e);
  }

  return coininfo;
}

Widget coinInfo(String coinname, String coinId) {
  return FutureBuilder(
      future: _fetchCoinInfo(coinId),
      builder: (BuildContext context, AsyncSnapshot<CoinInfo> snapshot) {
        if (snapshot.hasData) {
          CoinInfo? coinInfodata = snapshot.data;

          return aboutSection(
              coinInfodata!.name,
              coinInfodata.description!.en!,
              coinInfodata.links!.homepage![0],
              coinInfodata.marketCapRank!,
              coinInfodata.assetPlatformId!);
        } else if (snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

Widget aboutSection(String? coinname, String description, String url,
    int marketCapRank, String platform) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "About $coinname",
          style: TextStyle(color: Colors.white60),
        ),
      ),
      Container(
          width: double.infinity,
          child: Card(
              elevation: 5.0,
              color: Colors.indigo,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                          child: description == ""
                              ? Text(" No info!")
                              : Text(description)),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Market Cap Rank",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white60),
                              ),
                              Text(
                                marketCapRank.toString(),
                                style: TextStyle(color: Colors.white60),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Platform",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white60),
                              ),
                              Text(
                                platform,
                                style: TextStyle(color: Colors.white60),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextButton.icon(
                          onPressed: () {
                            _launchURL(url);
                          },
                          icon: Icon(Icons.public),
                          label: Text("Web site")),
                    ],
                  ))))
    ],
  );
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}
