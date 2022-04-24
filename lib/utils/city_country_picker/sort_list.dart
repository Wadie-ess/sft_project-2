import 'package:flutter/foundation.dart';

class SortList {
  
  
  static List<dynamic> sortList(
      {@required List<dynamic> listToSort, @required String searchedItem}) {
    List<dynamic> listToReturn = [];
    for (var item in listToSort) {
      if (item.toString().startsWith(searchedItem)) {
        listToReturn.add(item);
      }
    }
    return listToReturn;
  }
  
  static List<dynamic> sortMap(
      {@required Map<dynamic, dynamic> mapToSort, @required String searchedItem}) {
    List<dynamic> listToReturn = [];
    for (var item in mapToSort.values) {
      if (item.toString().startsWith(searchedItem)) {
        listToReturn.add(item);
      }
    }
    return listToReturn;
  }
  
  
  
}
