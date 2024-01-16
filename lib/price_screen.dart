import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<DropdownMenuItem> getDopDownMenu() {
    List<DropdownMenuItem<String>> dropdown = [];
    for (String currency in currenciesList) {
      var dropdownitem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdown.add(dropdownitem);
    }
    return dropdown;
  }

  CoinData coinData = CoinData(coinName: 'BTC');
  CoinData coinData2 = CoinData(coinName: 'ETH');
  CoinData coinData3 = CoinData(coinName: 'LTC');

  void getData(CoinData coinData) async {
    String coinRate1 = await coinData.getCoinRates();
    setState(() {
      coinData.coinRate2 = coinRate1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(coinData);
    getData(coinData2);
    getData(coinData3);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[0]} = ${coinData.coinRate2} ${coinData.selectedCurrency}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[1]} = ${coinData2.coinRate2} ${coinData2.selectedCurrency}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ${cryptoList[2]} = ${coinData3.coinRate2} ${coinData3.selectedCurrency}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: coinData.selectedCurrency,
              onChanged: (value) {
                setState(() {
                  coinData.selectedCurrency = value;
                  coinData2.selectedCurrency = value;
                  coinData3.selectedCurrency = value;

                  getData(coinData);
                  getData(coinData2);
                  getData(coinData3);
                });
              },
              items: getDopDownMenu(),
            ),
          ),
        ],
      ),
    );
  }
}
