import 'package:equatable/equatable.dart';
import 'package:moviedb_viewer/domain/entities/cast.dart';

class Credits extends Equatable{
  int id;
  List<Cast> cast;

  Credits({
    required this.id,
    required this.cast,
  });

  @override
  List<Object?> get props => [
    id,
    cast
  ];
}