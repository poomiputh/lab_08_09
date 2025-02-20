import 'dart:convert';

import 'package:flutter/services.dart';

abstract class AddressDb {
  Future<void> loadJsonData(String path);

  Iterable<String> search(String keyword);
}

class AddressDbJson implements AddressDb {
  dynamic addressData;

  AddressDbJson();

  Future<void> loadJsonData(String path) async {
    String jsonString = await rootBundle.loadString(path);
    final jsonResult = jsonDecode(jsonString);
    this.addressData = jsonResult;
  }

  Iterable<String> search(String keyword) {
    if (addressData == null) {
      return [];
    }
    return Iterable<String>.empty();
  }

  Iterable<String> searchJsonKey(String keyword, String jsonKey) {
    if (addressData == null) {
      return [];
    }
    Iterable<String> result = (addressData as List<dynamic>)
        .where((dynamic item) => (item[jsonKey] as String).contains(keyword))
        .map((dynamic item) => item[jsonKey] as String)
        .toSet();
    return result;
  }

  Iterable<dynamic> searchJsonKeys(Map<String, dynamic> jsonKeyValue) {
    if (addressData == null) {
      return [];
    }
    Iterable<dynamic> result = (addressData as List<dynamic>)
        .where((dynamic item) {
          bool pass = true;
          jsonKeyValue.forEach((key, value) {
            if (!("${item[key]}").contains("$value")) {
              pass = false;
            }
          });
          return pass;
        });
    return result;
  }
}
