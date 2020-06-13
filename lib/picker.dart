import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

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