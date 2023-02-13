import 'package:anapact/_dummy_data_need_to_remove_global/res/res.dart';

import 'package:flutter/material.dart';

class SavedBluetoothScreen extends StatelessWidget {
  static const String id = '/savedBluetooth';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Bluetooth'),
        backgroundColor: colors.primaryColor,
        elevation: 1,
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: colors.primaryColor,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Image.asset(
                    assets.appLogoPng,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (_, index) {
                    return SizedBox();
                    // return BluetoothNameButton(
                    //   onPressed: () => print('I am called'),
                    //   size: size,
                    //   text: "Demo Bluetooth",
                    //   bleID: "65:FF:7D:DF:16:96",
                    // );
                  },
                ),
              ),
              GestureDetector(
                // onTap: () {
                //   AllBluetoothProvider _provider =
                //       Provider.of<AllBluetoothProvider>(context, listen: false);

                //   _provider.bluetoothState.state.listen((state) {
                //     if (state == BluetoothState.off) {
                //       showDialog(
                //         context: context,
                //         builder: (_) => SimpleDialog(
                //           title: Center(
                //             child: Text('Please Turn on Bluetooth'),
                //           ),
                //           children: [],
                //         ),
                //       );
                //     } else if (state == BluetoothState.on) {}
                //   });
                //   _provider.startBluetoothScan();
                //   Navigator.of(context).pushNamed(AllBluetoothscreen.id);
                // },
                child: Container(
                  height: 40,
                  width: size.width,
                  child: Center(
                    child: Text(
                      'Add new device',
                      style: TextStyle(
                        color: colors.white,
                        fontSize: 18,
                        letterSpacing: 1,
                        wordSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Image.asset(
                    assets.splashLogoPng,
                    width: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
