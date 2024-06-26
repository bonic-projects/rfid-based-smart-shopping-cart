/// Device Sensor Reading model
class DeviceReading {
  String rfid;
  DateTime lastSeen;

  DeviceReading({
    required this.rfid,
    required this.lastSeen,
  });

  factory DeviceReading.fromMap(Map data) {
    return DeviceReading(
      rfid: data['rfid'] ?? "",
      lastSeen: DateTime.fromMillisecondsSinceEpoch(data['ts']),
    );
  }
}

/// Device control model
class DeviceData {
  String l1;
  String l2;
  String? direction;

  DeviceData({
    required this.l1,
    required this.l2,
    required this.direction,
  });

  factory DeviceData.fromMap(Map data) {
    return DeviceData(
      l1: data['l1'] ?? "",
      l2: data['l2'] ?? "",
      direction: data['direction'],
    );
  }

  Map<String, dynamic> toJson() => {
        'l1': l1,
        'l2': l2,
      };
}
