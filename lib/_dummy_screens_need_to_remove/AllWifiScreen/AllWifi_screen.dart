import 'package:anapact/_dummy_data_need_to_remove_global/res/res.dart';
import 'package:flutter/material.dart';

class AllWifiScreen extends StatefulWidget {
  static const String id = '/allwifiscreen';
  late List<Map<String, dynamic>> data;

  AllWifiScreen({required String value}) {
    data = [];
    if (value.startsWith('0')) {
      List wifiNames = value.split(":")
        ..remove('1')
        ..remove(' ')
        ..removeLast();

      data = wifiNames
          .map((e) => {
                "name": e,
                "isConnected": false,
              })
          .toList();
    } else if (value.startsWith('1')) {
      List wifiNames = value.split(":")
        ..removeRange(0, 2)
        ..remove(' ')
        ..removeLast();

      for (var i = 0; i < wifiNames.length; i++) {
        if (i == 0) {
          data.add({
            "name": wifiNames[i],
            "isConnected": true,
          });
        } else {
          data.add({
            "name": wifiNames[i],
            "isConnected": false,
          });
        }
      }
    }
  }

  @override
  _AllWifiScreenState createState() => _AllWifiScreenState();
}

class _AllWifiScreenState extends State<AllWifiScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Wifi'),
        backgroundColor: colors.primaryColor,
        elevation: 1,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: colors.primaryColor,
        child: widget.data.isEmpty
            ? Center(
                child: Text('No data found'),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                child: ListView.builder(
                  itemCount: widget.data.length,
                  itemBuilder: (_, index) {
                    return SizedBox();
                    // return BluetoothNameButton(
                    //   onPressed: () {
                    //     showDialog(
                    //       barrierDismissible: false,
                    //       context: context,
                    //       builder: (_) {
                    //         return AlertDialog(
                    //           backgroundColor: Colors.white,
                    //           title: Text(widget.data[index]['name']),
                    //           content: TextField(
                    //               decoration: InputDecoration(
                    //             focusedBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: colors.secondaryColor, width: 1.0),
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: colors.secondaryColor, width: 1.0),
                    //             ),
                    //             hintText: 'Password',
                    //           )),
                    //           actions: [
                    //             TextButton(
                    //               onPressed: () {
                    //                 Navigator.of(context).pop();
                    //               },
                    //               child: Text(
                    //                 'CANCEL',
                    //                 style: TextStyle(
                    //                   color: colors.primaryColor,
                    //                 ),
                    //               ),
                    //             ),
                    //             TextButton(
                    //               onPressed: () {},
                    //               child: Text(
                    //                 'CONNECT',
                    //                 style: TextStyle(
                    //                   color: colors.primaryColor,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //     // Navigator.of(context).pushNamed(WifiPasswordScreen.id);
                    //   },
                    //   size: size,
                    //   bleID: widget.data[index]['isConnected']
                    //       ? 'Connected'
                    //       : "Not Connected",
                    //   text: widget.data[index]['name'],
                    // );
                  },
                ),
              ),
      ),
    );
  }
}
