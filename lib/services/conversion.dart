import 'package:flutter/material.dart';

import 'networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String websiteUrl='https://min-api.cryptocompare.com/data/pricemulti';

class Conversion{
  Future<Map<String,num>> getRates(String targetCurrency) async{
    Map<String,num> returnMap = {};
    NetworkHelper networkHelper = NetworkHelper(websiteUrl+"?fsyms=BTC,ETH,BNB,USDT,SOL&tsyms=${targetCurrency}&api_key=${dotenv.env['API_KEY']}");
    var jsonData= await networkHelper.getData();
    print(jsonData);
    returnMap['BTC']=jsonData['BTC'][targetCurrency];
    returnMap['ETH']=jsonData['ETH'][targetCurrency];
    returnMap['BNB']=jsonData['BNB'][targetCurrency];
    returnMap['USDT']=jsonData['USDT'][targetCurrency];
    returnMap['SOL']=jsonData['SOL'][targetCurrency];
    return returnMap;
  }
}