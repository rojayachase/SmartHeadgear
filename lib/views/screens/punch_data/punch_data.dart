import 'package:anapact/core/constant/app_assets.dart';
import 'package:anapact/core/constant/app_colors.dart';
import 'package:anapact/core/constant/app_sizes.dart';
import 'package:anapact/core/helpers/extensions.dart';
import 'package:anapact/views/screens/bluetooth/provider/blueooth_provider.dart';
import 'package:anapact/views/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PunchData extends ConsumerStatefulWidget {
  const PunchData({Key? key}) : super(key: key);

  @override
  PunchDataState createState() => PunchDataState();
}

class PunchDataState extends ConsumerState<PunchData> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(bluetoothProvider);
    //print("============== Punch ============: ${provider.listenData.length.toString()}");
    double forcePunch = provider.listenData.isNotEmpty
        ? (provider.listenData.map((e) => e - 4).reduce((a, b) => a + b)) /
            provider.listenData.length
        : 0;
 //print("============== Force Punch ============: ${forcePunch.toPrecision(2).toString()}");
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.currentSelectedDevice?.name ?? 'N/A'),
        elevation: 4,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // connectionStatusBar(provider.isConnected()),
          connectionStatusBar(provider.isConnectedListner),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                header('Punch'),
                SizedBoxH20(),
                countContainer(
                    provider.listenData.length.toString(), AppAssets.punchIcon),
                SizedBoxH50(),
                Divider(),
                SizedBoxH50(),
                header('Force Punch'),
                SizedBoxH20(),
                countContainer(forcePunch.toPrecision(2).toString(),
                    AppAssets.forcePunchIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget connectionStatusBar(bool isConnected) {
    return Container(
      color: isConnected ? AppColors.statusTextColor : AppColors.errorColor,
      height: Sizes.s30,
      width: double.infinity,
      child: Center(
        child: Text(
          'Status: ${isConnected ? 'Connected' : 'Disconnect'}',
        ),
      ),
    );
  }

  Widget header(title) {
    return Container(
      width: Sizes.s200,
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.s20,
        vertical: Sizes.s10,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightPrimaryColor,
        borderRadius: BorderRadius.circular(Sizes.s6),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: Sizes.s18,
          ),
        ),
      ),
    );
  }

  Widget countContainer(String value, String asset) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          asset,
          height: Sizes.s35,
        ),
        SizedBoxW20(),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: Sizes.s24,
          ),
        ),
      ],
    );
  }
}
