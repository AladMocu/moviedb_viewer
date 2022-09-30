import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviedb_viewer/domain/entities/cast.dart';

class CastDTO extends Equatable{
  String? profilePath;
  String name;

  CastDTO({
    required this.profilePath,
    required this.name,
  });

  @override
  List<Object?> get props => [
    profilePath,
    name
  ];

  //from json
  factory CastDTO.fromJson(Map<String, dynamic> json) => CastDTO(
    profilePath: json["profile_path"],
    name: json["name"],
  );

  //to json
  Map<String, dynamic> toJson() => {
    "profile_path": profilePath,
    "name": name,
  };

  //from json list
  static List<CastDTO> fromJsonList(List list) {
    if (list.isEmpty) return [];
    return list.map((item) => CastDTO.fromJson(item)).toList();
  }

  //to entity
  Cast toEntity() => Cast(
    profilePath: profilePath==null?null:"https://image.tmdb.org/t/p/w500$profilePath",
    name: name,
  );

}