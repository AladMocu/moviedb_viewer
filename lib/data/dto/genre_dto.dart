import 'package:equatable/equatable.dart';
import 'package:moviedb_viewer/domain/entities/genre.dart';

class GenreDTO extends Equatable{
  int? id;
  String? name;

  GenreDTO({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
    id,
    name
  ];
  
  //from json
  factory GenreDTO.fromJson(Map<String, dynamic> json) => GenreDTO(
    id: json["id"],
    name: json["name"],
  );

  //to json
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  //from json list
  static List<GenreDTO> fromJsonList(List list) {
    if (list.isEmpty) return [];
    return list.map((item) => GenreDTO.fromJson(item)).toList();
  }

  //to entity
  Genre toEntity() => Genre(
    id: id!,
    name: name!,
  );
}