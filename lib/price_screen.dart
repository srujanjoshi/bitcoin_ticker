import 'dart:convert';

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'services/conversion.dart';


class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  Conversion conversion = Conversion();

  String selectedCurrency='USD';

  Map<String,num> conversionValues={};

  @override
  void initState (){
    asyncInitState();
    super.initState();
  }
  void asyncInitState() async{
    conversionValues= await conversion.getRates(selectedCurrency);
    setState(() {
      selectedCurrency='USD';
    });
  }

  DropdownButton<String> currencyOptions() {
    List<DropdownMenuItem<String>> currencyList = [];
    for (String currency in currenciesList) {
      DropdownMenuItem<String> listItem = DropdownMenuItem<String>(
        child: Text(currency),
        value: currency,
      );
      currencyList.add(listItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      icon: const Icon(Icons.arrow_downward),
      onChanged: (String? newValue) async{
        conversionValues= await conversion.getRates(newValue!);
        setState(() {
          selectedCurrency = newValue;
        });
      },
      items: currencyList,
    );
  }

  List<Text>currencyTextItems(){
    List<Text> currencyList= [];
    for (String currency in currenciesList){
      currencyList.add(Text(currency));
    }
    return currencyList;
  }

  CupertinoPicker currencyOptionsIOS(){
    List<Text> currencyList= [];
    for (String currency in currenciesList){
      currencyList.add(Text(currency));
    }
    return CupertinoPicker(
      children: currencyList ,
      itemExtent: 30,
      onSelectedItemChanged: (int i) async{
        conversionValues= await conversion.getRates(currenciesList[i]);
        setState(() {
          selectedCurrency=currenciesList[i];
        });
      },
    );
  }

  @override
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
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${conversionValues['BTC']} ${selectedCurrency}',
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
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = ${conversionValues['ETH']} ${selectedCurrency}',
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
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = ${conversionValues['BNB']} ${selectedCurrency}',
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
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 USDT = ${conversionValues['USDT']} ${selectedCurrency}',
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
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 SOL = ${conversionValues['SOL']} ${selectedCurrency}',
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
            child: (Platform.isIOS)?currencyOptionsIOS() : currencyOptions(),
          ),
        ],
      ),
    );
  }
}
