import 'dart:async';
import 'package:anapact/routes/routes.dart';
import 'package:anapact/views/widgets/loader.dart';
import 'package:bluetooth_connector/bluetooth_connector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeChangeNotifierProvider<BluetoothProvider> bluetoothProvider =
    ChangeNotifierProvider.autoDispose((ref) => BluetoothProvider(ref.read));

class BluetoothProvider extends ChangeNotifier {
  Map<String, String> deviceUserName = {};
  Map<String, List<double>> devicePunchValues = {};
  List<BluetoothDevice> connectedBluetoothDevice = [];

  final Reader ref;
  bool isLoading = true;
  List<ScanResult> bluetoothList = [];

  List<BtDevice> pairedBluetoothDevices = [];
  Timer? reloadTimer;
  Timer? reloadConnectedDevices;
  bool isConnectedListner = false;
  List<double> listenData = [];

  BluetoothDevice? currentSelectedDevice;
  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothConnector flutterbluetoothconnector = BluetoothConnector();

  BluetoothProvider(this.ref) {
    getNewBluetoothDevices();

    reloadTimer = Timer.periodic(Duration(seconds: 60), (timer) {
      getNewBluetoothDevices();
    });
    reloadConnectedDevices = Timer.periodic(Duration(seconds: 5), (timer) {
      getConnectedDevices();
    });
  }

  @override
  void dispose() {
    reloadTimer?.cancel();
    reloadConnectedDevices?.cancel();
    super.dispose();
  }

  void isConnected() {
    var data = connectedBluetoothDevice
        .where((el) => el.id == currentSelectedDevice?.id);
    data.isEmpty
        ? {isConnectedListner = false, listenData = []}
        : isConnectedListner = true;

    notifyListeners();
  }

  void setLoadingState(bool n) {
    isLoading = n;
    notifyListeners();
  }

  void setCurrentSelectedDevice(BluetoothDevice n) {
    currentSelectedDevice = n;
    notifyListeners();
  }

  void saveUserNames(String deviceId, String userName) {
    deviceUserName[deviceId] = userName;
    notifyListeners();
  }

  void saveDevicePunchValue(String deviceId, double data) {
    if (devicePunchValues[deviceId] == null) {
      devicePunchValues[deviceId] = [data];
    }
    devicePunchValues[deviceId]?.add(data);

    notifyListeners();
  }

  Future<void> getConnectedDevices() async {
    var d = await flutterBlue.connectedDevices;
    connectedBluetoothDevice =
        d.where((e) => e.name.toLowerCase().startsWith('headgear')).toList();
    isConnected();
    notifyListeners();
  }

  Future<void> getNewBluetoothDevices() async {
    setLoadingState(true);

    try {
      List<ScanResult> list = await flutterBlue.startScan(
        timeout: Duration(seconds: 5),
        scanMode: ScanMode.opportunistic,
      );

      bluetoothList = list;
    } catch (err) {
      print(err);
    }

    setLoadingState(false);
  }

  Future<void> getPairedBluetoothDevices() async {
    try {
      List<BtDevice> devices = await flutterbluetoothconnector.getDevices();
      pairedBluetoothDevices = devices
          .where((e) => e.name?.toLowerCase().startsWith('headgear') ?? false)
          .toList();
    } catch (err) {
      print(err);
    }
  }

  Future<void> connectToBluetooth(
      BluetoothDevice device, String? name, BuildContext context) async {
    try {
      Loader.show(context);
      await device.connect(timeout: Duration(seconds: 10));
      setCurrentSelectedDevice(device);
      saveUserNames(device.id.toString(), name ?? "Player");
      //context.showSuccessSnackBar('Device Connected', millisecond: 1);

      List<BluetoothService> services = await device.discoverServices();
      //context.showSuccessSnackBar('Services Discovered', millisecond: 2);
      BluetoothService tapServices = services.firstWhere((service) =>
          service.uuid.toString() == "96eb658c-26f6-473b-b503-4815eb5b4258");
      // context.showSuccessSnackBar('Found Constant Services', millisecond: 3);

      BluetoothCharacteristic tapCharactersistic = tapServices.characteristics
          .firstWhere((elem) =>
              elem.uuid.toString() == '96eb658d-26f6-473b-b503-4815eb5b4258');
      //context.showSuccessSnackBar('Found Constant Charactersistic',
      //millisecond: 4);
      print(
          "============= characteristics value ================: 'Found Constant Charactersistic'");
      // BluetoothCharacteristic characteristics = services[0].characteristics[0];
      BluetoothCharacteristic characteristics = tapCharactersistic;

      await characteristics.setNotifyValue(true);
      // context.showSuccessSnackBar('Charactersistic Notifier Setup',
      // millisecond: 5);
      Loader.dismiss(context);

      getNewBluetoothDevices();
      // Navigator.of(context).pushNamed(Routes.punchDataScreen);
      Navigator.of(context).pushNamed(Routes.bothUserScreen);

      characteristics.value.listen((value) {
        // print("============= characteristics value ================: $value");
        double nValue =
            double.parse('${value[2]}') + double.parse('${value[3]}') / 256;
        // print(
        // "============= Last Two Char Combine value ================: $nValue");

        if (nValue > 4) listenData.add(nValue);
        if (nValue > 4) saveDevicePunchValue(device.id.toString(), nValue);
        isConnectedListner = true;

        notifyListeners();
      }, onError: (err) {
        print(err);
        isConnectedListner = false;
        listenData = [];
        notifyListeners();
      });
    } on Exception catch (_) {
      Loader.dismiss(context);
      debugPrint('EXCEPTION while connecting to Bluetooth');
      await device.disconnect();
    } catch (_) {
      Loader.dismiss(context);
      debugPrint('ERROR while connecting to Bluetooth');
      await device.disconnect();
    }
  }
}
