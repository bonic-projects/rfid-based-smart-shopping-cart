

class DeviceMovement {
  String? direction;

  DateTime? lastSeen;

  //

  DeviceMovement({
    required this.direction,
    this.lastSeen,
  });

//
  factory DeviceMovement.fromMap(Map data) {
    return DeviceMovement(
      direction: data['direction'],
      lastSeen: DateTime.fromMillisecondsSinceEpoch(data['ts']),
    );
  }

  //
  Map<String, dynamic> toJson() => {
        'direction': direction,
        'ts': lastSeen,
      };
}

