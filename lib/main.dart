import 'package:flutter/material.dart';
import 'package:lab_08_09/address_autocomplete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lab 08 & 09'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _province = "";
  String _amphoe = "";
  String _district = "";
  String _zipcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AddressAutocomplete(
              key: Key("ProvinceAutocomplete"),
              jsonKeyValue: {
                "province": _province,
                "amphoe": _amphoe,
                "district": _district,
                "zipcode": _zipcode
              },
              jsonPrimaryKey: "province",
              labelText: "เลือกจังหวัด",
              onValueSelected: (value) {
                setState(() {
                  _province = value;
                });
              },
            ),
            SizedBox(height: 20),
            AddressAutocomplete(
              key: Key("AmphoeAutocomplete"),
              jsonKeyValue: {
                "province": _province,
                "amphoe": _amphoe,
                "district": _district,
                "zipcode": _zipcode
              },
              jsonPrimaryKey: "amphoe",
              labelText: "เลือกอำเภอ",
              onValueSelected: (value) {
                setState(() {
                  _amphoe = value;
                });
              },
            ),
            SizedBox(height: 20),
            AddressAutocomplete(
              key: Key("DistrictAutocomplete"),
              jsonKeyValue: {
                "province": _province,
                "amphoe": _amphoe,
                "district": _district,
                "zipcode": _zipcode
              },
              jsonPrimaryKey: "district",
              labelText: "เลือกตำบล",
              onValueSelected: (value) {
                setState(() {
                  _district = value;
                });
              },
            ),
            SizedBox(height: 20),
            AddressAutocomplete(
              key: Key("ZipcodeAutocomplete"),
              jsonKeyValue: {
                "province": _province,
                "amphoe": _amphoe,
                "district": _district,
                "zipcode": _zipcode
              },
              jsonPrimaryKey: "zipcode",
              labelText: "เลือกรหัสไปรษณีย์",
              onValueSelected: (value) {
                setState(() {
                  _zipcode = value;
                });
              },
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
