import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Converter.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'USD';
  List<DropdownMenuItem<String>> getDropItems(){
    List<DropdownMenuItem<String>> dropDownItems = [];
    for(int i = 0; i<currenciesList.length; i++){
      var newItem = DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      );
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }


  List<Text> getCupertino(){
    List<Text> li = [];
    for(String i in currenciesList){
      Text a = Text(i);
      li.add(a);
    }
    return li;
  }

  CupertinoPicker iosPicker(){
    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex){
          print(selectedIndex);
        },
        children:getCupertino()
    );
  }

  DropdownButton androidPicker(){
    return DropdownButton<String>(
      value: selectedCurrency,
      items: getDropItems(), onChanged: (val){
      setState(() {
        selectedCurrency = val;
        //getValue();
      });
    },
    );
  }



  Widget picker(){
    if(TargetPlatform.iOS == true){

      return iosPicker();
    }
    else{
      return androidPicker();
    }
  }


  var x;
  Converter converter = Converter();
  void getValue() async{
      var change = await converter.getInfo("BTC", selectedCurrency);
      setState(() {
        x = change;
      });
  }

  @override
  Widget build(BuildContext context) {
    getValue();
    String val;
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC =  $x $selectedCurrency',
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
            child: picker(),
          ),
        ],
      ),
    );
  }
}

//DropdownButton<String>(
//value: selectedCurrency,
//items: getDropItems(), onChanged: (value){
//setState(() {
//selectedCurrency = value;
//});
//}),