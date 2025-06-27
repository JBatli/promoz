class AuditLog {
  final String id;
  final String userId;
  final String userRole;
  final String action;
  final String entityType;
  final String entityId;
  final DateTime timestamp;
  final Map<String, dynamic> details;
  final String ipAddress;

  AuditLog({
    required this.id,
    required this.userId,
    required this.userRole,
    required this.action,
    required this.entityType,
    required this.entityId,
    required this.timestamp,
    required this.details,
    required this.ipAddress,
  });

  factory AuditLog.fromJson(Map<String, dynamic> json) {
    return AuditLog(
      id: json['id'],
      userId: json['userId'],
      userRole: json['userRole'],
      action: json['action'],
      entityType: json['entityType'],
      entityId: json['entityId'],
      timestamp: DateTime.parse(json['timestamp']),
      details: json['details'] as Map<String, dynamic>,
      ipAddress: json['ipAddress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userRole': userRole,
      'action': action,
      'entityType': entityType,
      'entityId': entityId,
      'timestamp': timestamp.toIso8601String(),
      'details': details,
      'ipAddress': ipAddress,
    };
  }
}