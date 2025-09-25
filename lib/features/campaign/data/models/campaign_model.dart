import '../../domain/entities/campaign.dart';
import '../../domain/entities/campaign_status.dart';

class CampaignModel extends Campaign {
  const CampaignModel({
    required String id,
    required String name,
    required String description,
    required CampaignStatus status,
    required DateTime startDate,
    required DateTime endDate,
    required double discountPercentage,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
         id: id,
         name: name,
         description: description,
         status: status,
         startDate: startDate,
         endDate: endDate,
         discountPercentage: discountPercentage,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: CampaignStatus.fromString(json['status']), // Use enum directly
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': status.value, // Convert enum to string
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'discountPercentage': discountPercentage,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
