import 'package:anapact/core/constant/app_colors.dart';
import 'package:anapact/core/constant/app_sizes.dart';
import 'package:anapact/routes/routes.dart';
import 'package:anapact/views/dialogs/enter_username.dart';
import 'package:anapact/views/screens/bluetooth/provider/blueooth_provider.dart';
import 'package:anapact/views/screens/bluetooth/widgets/bluetooth_tile.dart';
import 'package:anapact/views/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//first screen that the app goes to outside of the splash screen
class BluetoothScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(bluetoothProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth'),
        elevation: 4,
        actions: [
          ElevatedButton(
              child: const Text('Feedback'),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.loginpage);
              }),
          IconButton(
            onPressed: () {
              provider.getNewBluetoothDevices();
              provider.getPairedBluetoothDevices();
            },
            icon: Icon(Icons.replay_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.bothUserScreen);
            },
            icon: Icon(Icons.attractions_outlined),
          ),
          ElevatedButton(
              child: const Text('Log In'),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.loginpage);
              }),
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: provider.isLoading
            ? Center(child: CircularProgressIndicator.adaptive())
            : RefreshIndicator(
                onRefresh: () async {
                  await provider.getNewBluetoothDevices();
                  // await provider.getPairedBluetoothDevices();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ListView(
                    children: [
                      // _getHeader('Paired Devices'),
                      // if (provider.pairedBluetoothDevices.isEmpty) ...[
                      //   SizedBoxH10(),
                      //   _noBluetoothError(),
                      //   SizedBoxH10(),
                      // ],
                      // ...provider.pairedBluetoothDevices.map((e) {
                      //   String uuid = e.address ?? 'N/A';
                      //   String deviceName = e.name ?? 'Unknown Device';

                      //   return BluetoothTile(
                      //     bleID: uuid,
                      //     deviceName: deviceName,
                      //     onPressed: () {},
                      //   );
                      // }),
                      // SizedBoxH20(),
                      // Divider(),

                      if (provider.connectedBluetoothDevice.isNotEmpty) ...[
                        _getHeader('Connected Devices'),
                        ...provider.connectedBluetoothDevice.map((e) {
                          String uuid = '${e.id}';
                          String deviceName =
                              e.name.isEmpty ? 'Unknown Device' : e.name;
                          if (!deviceName.toLowerCase().startsWith('headgear'))
                            return SizedBox();

                          return BluetoothTile(
                            bleID: uuid,
                            deviceName: deviceName,
                            onPressed: () {
                              // Navigator.of(context)
                              //     .pushNamed(Routes.punchDataScreen);
                              Navigator.of(context)
                                  .pushNamed(Routes.bothUserScreen);
                            },
                          );
                        }),
                      ],

                      _getHeader('New Devices'),
                      if (provider.bluetoothList.isEmpty) ...[
                        SizedBoxH10(),
                        _noBluetoothError(),
                      ],
                      ...provider.bluetoothList.map((e) {
                        String uuid = '${e.device.id}';
                        String deviceName = e.device.name.isEmpty
                            ? 'Unknown Device'
                            : e.device.name;
                        if (!deviceName.toLowerCase().startsWith('headgear'))
                          return SizedBox();

                        return BluetoothTile(
                          bleID: uuid,
                          deviceName: deviceName,
                          onPressed: () async {
                            var name = await EnterUserNameDialog.show(context);
                            if (name != null)
                              provider.connectToBluetooth(
                                  e.device, name, context);
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _noBluetoothError() {
    return Center(
      child: Text(
        'No bluetooth Found',
        style: TextStyle(
          fontSize: Sizes.s20.sp,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  Widget _getHeader(title) {
    return Padding(
      padding: EdgeInsets.only(
        left: Sizes.s12.sp,
        bottom: Sizes.s5.sp,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: Sizes.s18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
