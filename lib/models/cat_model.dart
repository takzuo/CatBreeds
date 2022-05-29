import 'package:flutter/material.dart';

class CatModel{
    //List<String> wight; // imperial, metric
    String id;
    String name;
    String cfa_url;
    String vetstreet_url;
    String vcahospitals_url;
    String temperament;
    String origin;
    String country_codes;
    String country_code;
    String description;
    String life_span;
    int indoor;
    int lap;
    String alt_names;
    int adaptability;
    int affectation_level;
    int child_friendly;
    int dog_friendly;
    int energy_level;
    int grooming;
    int health_issues;
    int intelligence;
    int shedding_level;
    int social_needs;
    int stranger_friendly;
    int vocalisation;
    int experimental;
    int hairless;
    int natural;
    int rare;
    int rex;
    int suppressed_tail;
    int short_legs;
    String wikipedia_url;
    int hypoallergenic;
    String reference_image_id;
    //List<dynamic> image; // id, width, height, url

    CatModel({
        required this.id,
        required this.name,
        required this.cfa_url,
        required this.vetstreet_url,
        required this.vcahospitals_url,
        required this.temperament,
        required this.origin,
        required this.country_codes,
        required this.country_code,
        required this.description,
        required this.life_span,
        required this.indoor,
        required this.lap,
        required this.alt_names,
        required this.adaptability,
        required this.affectation_level,
        required this.child_friendly,
        required this.dog_friendly,
        required this.energy_level,
        required this.grooming,
        required this.health_issues,
        required this.intelligence,
        required this.shedding_level,
        required this.social_needs,
        required this.stranger_friendly,
        required this.vocalisation,
        required this.experimental,
        required this.hairless,
        required this.natural,
        required this.rare,
        required this.rex,
        required this.suppressed_tail,
        required this.short_legs,
        required this.wikipedia_url,
        required this.hypoallergenic,
        required this.reference_image_id,
        //required this.image,
    });


    static CatModel fromJson(Map<String, dynamic> json){
      return CatModel(
        id: json['id'] as String,
        name: json['name'] as String,
        cfa_url: json['cfa_url'] as String,
        vetstreet_url: json['vetstreet_url'] as String,
        vcahospitals_url: json['vcahospitals_url'] as String,
        temperament: json['temperament'] as String,
        origin: json['origin'] as String,
        country_codes: json['country_codes'] as String,
        country_code: json['country_code'] as String,
        description: json['description'] as String,
        life_span: json['life_span'] as String,
        indoor: json['indoor'] as int,
        lap: json['lap'] as int,
        alt_names: json['alt_names'] as String,
        adaptability: json['adaptability'] as int,
        affectation_level: json['affectation_level'] as int,
        child_friendly: json['child_friendly'] as int,
        dog_friendly: json['dog_friendly'] as int,
        energy_level: json['energy_level'] as int,
        grooming: json['grooming'] as int,
        health_issues: json['health_issues'] as int,
        intelligence: json['intelligence'] as int,
        shedding_level: json['shedding_level'] as int,
        social_needs: json['social_needs'] as int,
        stranger_friendly: json['stranger_friendly'] as int,
        vocalisation: json['vocalisation'] as int,
        experimental: json['experimental'] as int,
        hairless: json['hairless'] as int,
        natural: json['natural'] as int,
        rare: json['rare'] as int,
        rex: json['rex'] as int,
        suppressed_tail: json['suppressed_tail'] as int,
        short_legs: json['short_legs'] as int,
        wikipedia_url: json['wikipedia_url'] as String,
        hypoallergenic: json['hypoallergenic'] as int,
        reference_image_id: json['reference_image_id'] as String,
        //image: json['image'] as List<String>,

      );
    }

}