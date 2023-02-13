import 'package:anapact/core/constant/app_colors.dart';
import 'package:anapact/core/constant/app_sizes.dart';
import 'package:anapact/views/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

class BluetoothTile extends StatelessWidget {
  final String deviceName;
  final String bleID;
  final VoidCallback onPressed;

  const BluetoothTile({
    Key? key,
    required this.deviceName,
    required this.onPressed,
    required this.bleID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // height: ,
        margin: EdgeInsets.all(Sizes.s10.sp),
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.s20.sp,
          vertical: Sizes.s10.sp,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(Sizes.s6.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 220,
                  child: Text(
                    deviceName,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.backgroundColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBoxH10(),
                SizedBox(
                  width: 220,
                  child: Text(
                    bleID,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.backgroundColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.backgroundColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
