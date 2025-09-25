// This file should be moved to domain/entities/campaign_status.dart
// Enum doesn't need a Model layer in Clean Architecture

enum CampaignStatus {
  draft('DRAFT'),
  active('ACTIVE'),
  paused('PAUSED'),
  expired('EXPIRED'),
  disabled('DISABLED');

  const CampaignStatus(this.value);

  final String value;

  static CampaignStatus fromString(String value) {
    return CampaignStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => CampaignStatus.draft,
    );
  }
}
