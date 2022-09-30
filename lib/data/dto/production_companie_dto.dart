import 'package:equatable/equatable.dart';
import 'package:moviedb_viewer/domain/entities/production_company.dart';

class ProductionCompanyDTO extends Equatable{
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanyDTO({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  @override
  List<Object?> get props => [
    id,
    name
  ];
    
  //from json
  factory ProductionCompanyDTO.fromJson(Map<String, dynamic> json) => ProductionCompanyDTO(
    id: json["id"],
    logoPath: json["logo_path"],
    name: json["name"],
    originCountry: json["origin_country"],
  );

  //to json
  Map<String, dynamic> toJson() => {
    "id": id,
    "logo_path": logoPath,
    "name": name,
    "origin_country": originCountry,
  };

  //from json list
  static List<ProductionCompanyDTO> fromJsonList(List list) {
    if (list.isEmpty) return [];
    return list.map((item) => ProductionCompanyDTO.fromJson(item)).toList();
  }

  //to entity
  ProductionCompany toEntity() => ProductionCompany(
    id: id!,
    logoPath: logoPath??'',
    name: name!,
    originCountry: originCountry!,
  );
  
}