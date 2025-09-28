class GetProductsByCategory {
  final String categoryId;
  final int limit;

  const GetProductsByCategory._({
    required this.categoryId,
    required this.limit,
  });

  // ✅ Technical validation ở đây
  factory GetProductsByCategory({
    required String categoryId,
    int limit = 10,
  }) {
    if (categoryId.trim().isEmpty) {
      throw ArgumentError('Category ID cannot be empty');
    }

    if (limit <= 0) {
      throw ArgumentError('Limit must be positive');
    }

    if (limit > 50) {
      throw ArgumentError('Limit cannot exceed 50');
    }

    return GetProductsByCategory._(
      categoryId: categoryId.trim(),
      limit: limit,
    );
  }
}