import 'package:equatable/equatable.dart';

abstract class Entity extends Equatable {
  Map<String, dynamic> toJson();
}

// class Entity<T> extends Equatable {
//   @override
//   List<Object?> get props => [];
//
//   factory Entity.fromJson(Map<String, dynamic> json) => ;
//
//   Map<String, dynamic> toJson() => {};
// }