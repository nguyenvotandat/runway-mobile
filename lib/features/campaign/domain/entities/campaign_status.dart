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

  @override
  String toString() => value;
}
