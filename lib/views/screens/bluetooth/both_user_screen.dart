import 'package:anapact/core/constant/app_colors.dart';
import 'package:anapact/core/constant/app_sizes.dart';
import 'package:anapact/core/helpers/extensions.dart';
import 'package:anapact/views/screens/bluetooth/provider/blueooth_provider.dart';
import 'package:anapact/views/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BothUserScreen extends ConsumerWidget {
  const BothUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(bluetoothProvider);
    final device1Id = provider.connectedBluetoothDevice.length > 0
        ? provider.connectedBluetoothDevice[0].id.toString()
        : null;
    final device2Id = provider.connectedBluetoothDevice.length > 1
        ? provider.connectedBluetoothDevice[1].id.toString()
        : null;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.primaryColor,
        title: Text('Let\'s Play'),
        centerTitle: true,
        elevation: 4,
        actions: [
          if (provider.deviceUserName.length < 2)
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.add),
            ),
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBoxH25(),
            if (provider.deviceUserName.length == 0) buildError(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (provider.deviceUserName.length > 0)
                  buildPlayers(
                    username: provider.deviceUserName[device1Id] ?? '',
                    punch: provider.devicePunchValues[device1Id]?.length
                            .toString() ??
                        '0',
                    forcePunch: provider.devicePunchValues[device1Id] ?? [],
                  ),
                if (provider.deviceUserName.length > 1) ...[
                  buildDivider(context),
                  buildPlayers(
                    username: provider.deviceUserName[device2Id] ?? '',
                    punch: provider.devicePunchValues[device2Id]?.length
                            .toString() ??
                        '0',
                    forcePunch: provider.devicePunchValues[device2Id] ?? [],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Text(
        'No Device is Connected',
        style: TextStyle(
          fontSize: Sizes.s20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildDivider(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
        width: 1,
        height: deviceHeight / 1.8,
        color: Colors.grey.shade300,
      ),
    );
  }

  Widget buildPlayers({
    required String username,
    required String punch,
    required List<double> forcePunch,
  }) {
    double fp = forcePunch.isNotEmpty
        ? (forcePunch.map((e) => e - 4).reduce((a, b) => a + b)) /
            forcePunch.length
        : 0;

    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          child: Image.asset('assets/images/user_1.png'),
        ),
        Center(
          child: Text(
            username,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        SizedBoxH45(),
        Center(
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: AppColors.errorColor,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                'Punch',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ),
        ),
        SizedBoxH10(),
        Center(
          child: Text(
            '🥊  $punch',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        SizedBoxH25(),
        Container(
          width: 100,
          height: 1,
          color: Colors.grey.shade300,
        ),
        SizedBoxH35(),
        Center(
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                'Punch Force',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Center(
          child: Text(
            '💪  ${fp.toPrecision(2).toString()}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
