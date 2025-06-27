class AdminSettings {
  final String id;
  final bool maintenanceMode;
  final bool newUserApprovalRequired;
  final double commissionRate;

  AdminSettings({
    required this.id,
    required this.maintenanceMode,
    required this.newUserApprovalRequired,
    required this.commissionRate,
  });

  factory AdminSettings.fromJson(Map<String, dynamic> json) {
    return AdminSettings(
      id: json['id'] as String,
      maintenanceMode: json['maintenanceMode'] as bool,
      newUserApprovalRequired: json['newUserApprovalRequired'] as bool,
      commissionRate: json['commissionRate'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'maintenanceMode': maintenanceMode,
      'newUserApprovalRequired': newUserApprovalRequired,
      'commissionRate': commissionRate,
    };
  }
}