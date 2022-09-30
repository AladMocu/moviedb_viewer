import 'package:equatable/equatable.dart';
import 'package:moviedb_viewer/data/dto/cast_dto.dart';
import 'package:moviedb_viewer/domain/entities/credits.dart';

class CreditsDTO extends Equatable{
  int id;
  List<CastDTO> cast;

  CreditsDTO({
    required this.id,
    required this.cast,
  });

  @override
  List<Object?> get props => [
    id,
    cast
  ];

  //from json
  factory CreditsDTO.fromJson(Map<String, dynamic> json) => CreditsDTO(
    id: json["id"],
    cast: CastDTO.fromJsonList(json["cast"]),
  );

  //to json
  Map<String, dynamic> toJson() => {
    "id": id,
    "cast": cast,
  };

  //to entity
  Credits toEntity() => Credits(
    id: id,
    cast: cast.map((e) => e.toEntity()).toList(),
  );

}