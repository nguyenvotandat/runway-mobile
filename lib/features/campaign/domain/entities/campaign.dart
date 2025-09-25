import 'package:equatable/equatable.dart';
import 'campaign_status.dart';

class Campaign extends Equatable {
  final String id;
  final String name;
  final String description;
  final CampaignStatus status;
  final DateTime startDate;
  final DateTime endDate;
  final double discountPercentage;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Campaign({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.discountPercentage,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
    id,
    name,
    description,
    status,
    startDate,
    endDate,
    discountPercentage,
    createdAt,
    updatedAt,
  ];
}
