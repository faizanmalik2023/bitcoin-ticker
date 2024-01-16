import 'package:http/http.dart' as http;
import 'dart:convert';

const apikey = 'B6F3AE1A-5F7B-414E-A55F-AFF04B61BA46';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CoinData({this.coinName});
  String coinRate2 = '?';
  String coinName = 'BTC';
  String selectedCurrency = 'USD';

  Future<String> getCoinRates() async {
    String ur2 =
        'https://rest.coinapi.io/v1/exchangerate/$coinName/$selectedCurrency?apikey=$apikey';
    Uri url = Uri.parse(ur2);

    http.Response response = await http.get(url);
    var data = response.body;
    double coinRate = jsonDecode(data)['rate'];

    coinRate2 = coinRate.toStringAsFixed(2);
    return coinRate2;
  }
}
