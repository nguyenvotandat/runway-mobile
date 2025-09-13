import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String id;
  final String name;
  final String? slug;

  const CategoryModel({required this.id, required this.name, this.slug});

  @override
  List<Object?> get props => [id, name, slug];
}
