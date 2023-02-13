import 'package:anapact/core/constant/app_colors.dart';
import 'package:anapact/core/constant/app_sizes.dart';
import 'package:anapact/core/helpers/extensions.dart';
import 'package:anapact/views/widgets/primary_button.dart';
import 'package:anapact/views/widgets/primary_text_field.dart';
import 'package:anapact/views/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

class EnterUserNameDialog extends StatelessWidget {
  final TextEditingController controller;

  EnterUserNameDialog(this.controller);

  static Future<String?> show(BuildContext context) async {
    final TextEditingController username = TextEditingController();

    var result = await showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black12,
        builder: (context) => EnterUserNameDialog(username));

    if (result == true) return username.text;
    return null;
  }

  bool usernameValidator(String? text, BuildContext context) {
    if (text != null && text.isEmpty) {
      context.showFailureSnackBar("Username is Mandatory");
      return false;
    }
    if (text != null && text.length < 3) {
      context.showFailureSnackBar(
          "Username length should be atleast 3 Characters");
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Device Name'),
          SizedBoxH20(),
          PrimaryTextField(
            controller: controller,
            hintText: 'Enter Username',
          ),
          SizedBoxH20(),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  height: Sizes.s44.h,
                  color: AppColors.primaryColor,
                  label: 'Connect',
                  onPressed: () {
                    var status = usernameValidator(controller.text, context);
                    if (status) Navigator.pop(context, true);
                  },
                ),
              ),
              SizedBoxW15(),
              Expanded(
                child: PrimaryButton.outlined(
                  height: Sizes.s44.h,
                  label: 'Cancle',
                  textColor: Colors.black,
                  color: Colors.grey.shade300,
                  onPressed: () => Navigator.pop(context, false),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
