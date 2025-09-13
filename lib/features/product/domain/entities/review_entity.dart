import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String id;
  final String productId;
  final String userId;
  final int rating;
  final String? comment;
  final DateTime createdAt;

  const ReviewEntity({
    required this.id,
    required this.productId,
    required this.userId,
    required this.rating,
    required this.createdAt,
    this.comment,
  });

  @override
  List<Object> get props => [id, productId, userId, rating, createdAt, comment ?? ''];
}
