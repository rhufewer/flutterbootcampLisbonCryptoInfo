import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lisbon_bootcamp/coin.dart';
import 'package:flutter_lisbon_bootcamp/detail.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Trending App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Trending Cryptos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              // backgroundColor: Colors.indigo[600],
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                    child: Text(
                      "Trending today",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 35.0),
                    )),
                Text("Discover the next famous cryptocurrency"),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(child: coinsList())
              ],
            )));
  }
}

Widget coinsList() {
  return FutureBuilder(
      future: _fetchCoinsData(),
      builder: (BuildContext context, AsyncSnapshot<List<Coin>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final coinData = snapshot.data![index];
                return coinTile(coinData, context);
              });
        } else if (snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

Widget coinTile(Coin coindata, BuildContext context) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    title: Container(
      height: 100.0,
      child: Card(
          elevation: 5.0,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: new Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Image.network(coindata.smallImg!),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    coindata.name!,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    coindata.price!.toStringAsFixed(4),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text("+ info"),
                ),
              ),
            ],
          )),
    ),
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CoinDetail(coindetail: coindata)));
    },
  );
}

//fetch data from API
Future<List<Coin>> _fetchCoinsData() async {
  List<Coin> coins = []; //coin list from API

  http.Response response; //try to get response GET

  try {
    response = await http
        .get(Uri.parse("https://api.coingecko.com/api/v3/search/trending"));

    if (response.statusCode == HttpStatus.ok) {
      final mappingResponse = json.decode(response.body);

      coins = mappingResponse["coins"].map<Coin>((data) {
        return Coin.fromJson(data);
      }).toList();
    }
  } catch (e) {
    throw Exception(e);
  }

  return coins;
}
