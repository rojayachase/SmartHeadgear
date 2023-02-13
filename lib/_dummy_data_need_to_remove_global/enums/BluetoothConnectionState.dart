enum BluetoothConnectionState { Idel, Connecting, Connected, Failed }

String bluetoothConnectionStateEnumToString(BluetoothConnectionState state) {
  switch (state) {
    case BluetoothConnectionState.Idel:
      return "Idel";
    case BluetoothConnectionState.Connecting:
      return "Connecting";
    case BluetoothConnectionState.Connected:
      return "Connected";
    case BluetoothConnectionState.Failed:
      return "Failed";
    default:
      return 'Unknown';
  }
}
