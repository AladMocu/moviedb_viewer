import 'package:equatable/equatable.dart';

class Cast extends Equatable{
  String? profilePath;
  String name;

  Cast({
    required this.profilePath,
    required this.name,
  });

  @override
  List<Object?> get props => [
    profilePath,
    name
  ];
}