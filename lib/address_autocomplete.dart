import 'package:flutter/material.dart';
import 'package:lab_08_09/address_db.dart';

class AddressAutocomplete extends StatefulWidget {
  final Map<String, dynamic> jsonKeyValue;
  final String jsonPrimaryKey;
  final String labelText;
  final ValueSetter<String>? onValueSelected;

  const AddressAutocomplete(
      {super.key,
      required this.jsonKeyValue,
      required this.jsonPrimaryKey,
      required this.labelText,
      this.onValueSelected});

  @override
  State<AddressAutocomplete> createState() => _AddressAutocompleteState();
}

class _AddressAutocompleteState extends State<AddressAutocomplete> {
  AddressDbJson addressDbJson = AddressDbJson();
  final TextEditingController _textEditingController = TextEditingController();
  Map<String, dynamic> _jsonKeyValue = {};
  String _jsonPrimaryKey = "";

  @override
  void initState() {
    super.initState();
    addressDbJson.loadJsonData("lib/raw_database.json");
    _jsonKeyValue = widget.jsonKeyValue;
    _jsonPrimaryKey = widget.jsonPrimaryKey;
    _textEditingController.text = _jsonKeyValue[_jsonPrimaryKey];
  }

  @override
  void didUpdateWidget(covariant AddressAutocomplete oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the initialKeyword has changed
    _jsonKeyValue = widget.jsonKeyValue;
    _jsonPrimaryKey = widget.jsonPrimaryKey;
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
      // if (_textEditingController.text.isEmpty) {
      //   return Iterable<String>.empty();
      // }
      Iterable<dynamic> addresses = addressDbJson.searchJsonKeys(_jsonKeyValue);
      return addresses
          .map((dynamic fullAddress) => "${fullAddress[_jsonPrimaryKey]}")
          .toSet();
    }, fieldViewBuilder:
            (context, textEditingController, focusNode, onFieldSubmitted) {
      textEditingController.text = _textEditingController.text;
      return TextField(
        controller: _textEditingController,
        onChanged: (text) => setState(() {
          _jsonKeyValue[_jsonPrimaryKey] = text;
          if (widget.onValueSelected != null) {
            widget.onValueSelected!(text);
          }
        }),
        focusNode: focusNode,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          labelText: widget.labelText,
          border: OutlineInputBorder(),
        ),
        onTapOutside: (pointer) {
          focusNode.unfocus();
        },
      );
    }, onSelected: (value) {
      _textEditingController.text = value;
      if (widget.onValueSelected != null) {
        widget.onValueSelected!(value);
      }
    });
  }
}
