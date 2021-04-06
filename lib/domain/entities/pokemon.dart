// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<Ability>.from(json['abilities'].map((x) => Ability.fromJson(x))),
        baseExperience: json['base_experience'],
        forms: List<Species>.from(json['forms'].map((x) => Species.fromJson(x))),
        gameIndices: List<GameIndex>.from(json['game_indices'].map((x) => GameIndex.fromJson(x))),
        height: json['height'],
        heldItems: List<dynamic>.from(json['held_items'].map((x) => x)),
        id: json['id'],
        isDefault: json['is_default'],
        locationAreaEncounters: json['location_area_encounters'],
        moves: List<Move>.from(json['moves'].map((x) => Move.fromJson(x))),
        name: json['name'],
        order: json['order'],
        pastTypes: List<dynamic>.from(json['past_types'].map((x) => x)),
        species: Species.fromJson(json['species']),
        sprites: Sprites.fromJson(json['sprites']),
        stats: List<Stat>.from(json['stats'].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json['types'].map((x) => Type.fromJson(x))),
        weight: json['weight'],
      );

  final List<Ability> abilities;
  final int baseExperience;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<dynamic> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;

  Map<String, dynamic> toJson() => {
        'abilities': List<dynamic>.from(abilities.map((x) => x.toJson())),
        'base_experience': baseExperience,
        'forms': List<dynamic>.from(forms.map((x) => x.toJson())),
        'game_indices': List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        'height': height,
        'held_items': List<dynamic>.from(heldItems.map((x) => x)),
        'id': id,
        'is_default': isDefault,
        'location_area_encounters': locationAreaEncounters,
        'moves': List<dynamic>.from(moves.map((x) => x.toJson())),
        'name': name,
        'order': order,
        'past_types': List<dynamic>.from(pastTypes.map((x) => x)),
        'species': species.toJson(),
        'sprites': sprites.toJson(),
        'stats': List<dynamic>.from(stats.map((x) => x.toJson())),
        'types': List<dynamic>.from(types.map((x) => x.toJson())),
        'weight': weight,
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });
  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json['ability']),
        isHidden: json['is_hidden'],
        slot: json['slot'],
      );

  final Species ability;
  final bool isHidden;
  final int slot;

  Map<String, dynamic> toJson() => {
        'ability': ability.toJson(),
        'is_hidden': isHidden,
        'slot': slot,
      };
}

class Species {
  Species({
    this.name,
    this.url,
  });
  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json['name'],
        url: json['url'],
      );

  final String name;
  final String url;

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.version,
  });
  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json['game_index'],
        version: Species.fromJson(json['version']),
      );

  final int gameIndex;
  final Species version;

  Map<String, dynamic> toJson() => {
        'game_index': gameIndex,
        'version': version.toJson(),
      };
}

class Move {
  Move({
    this.move,
    this.versionGroupDetails,
  });
  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json['move']),
        versionGroupDetails: List<VersionGroupDetail>.from(json['version_group_details'].map((x) => VersionGroupDetail.fromJson(x))),
      );

  final Species move;
  final List<VersionGroupDetail> versionGroupDetails;

  Map<String, dynamic> toJson() => {
        'move': move.toJson(),
        'version_group_details': List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
      };
}

class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });
  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json['level_learned_at'],
        moveLearnMethod: Species.fromJson(json['move_learn_method']),
        versionGroup: Species.fromJson(json['version_group']),
      );
  final int levelLearnedAt;
  final Species moveLearnMethod;
  final Species versionGroup;

  Map<String, dynamic> toJson() => {
        'level_learned_at': levelLearnedAt,
        'move_learn_method': moveLearnMethod.toJson(),
        'version_group': versionGroup.toJson(),
      };
}

class GenerationV {
  GenerationV({
    this.blackWhite,
  });
  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromJson(json['black-white']),
      );
  final Sprites blackWhite;

  Map<String, dynamic> toJson() => {
        'black-white': blackWhite.toJson(),
      };
}

class GenerationIv {
  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });
  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromJson(json['diamond-pearl']),
        heartgoldSoulsilver: Sprites.fromJson(json['heartgold-soulsilver']),
        platinum: Sprites.fromJson(json['platinum']),
      );

  final Sprites diamondPearl;
  final Sprites heartgoldSoulsilver;
  final Sprites platinum;

  Map<String, dynamic> toJson() => {
        'diamond-pearl': diamondPearl.toJson(),
        'heartgold-soulsilver': heartgoldSoulsilver.toJson(),
        'platinum': platinum.toJson(),
      };
}

class Versions {
  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });
  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(json['generation-i']),
        generationIi: GenerationIi.fromJson(json['generation-ii']),
        generationIii: GenerationIii.fromJson(json['generation-iii']),
        generationIv: GenerationIv.fromJson(json['generation-iv']),
        generationV: GenerationV.fromJson(json['generation-v']),
        generationVi: Map.from(json['generation-vi']).map((k, v) => MapEntry<String, GenerationVi>(k, GenerationVi.fromJson(v))),
        generationVii: GenerationVii.fromJson(json['generation-vii']),
        generationViii: GenerationViii.fromJson(json['generation-viii']),
      );

  final GenerationI generationI;
  final GenerationIi generationIi;
  final GenerationIii generationIii;
  final GenerationIv generationIv;
  final GenerationV generationV;
  final Map<String, GenerationVi> generationVi;
  final GenerationVii generationVii;
  final GenerationViii generationViii;

  Map<String, dynamic> toJson() => {
        'generation-i': generationI.toJson(),
        'generation-ii': generationIi.toJson(),
        'generation-iii': generationIii.toJson(),
        'generation-iv': generationIv.toJson(),
        'generation-v': generationV.toJson(),
        'generation-vi': Map.from(generationVi).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        'generation-vii': generationVii.toJson(),
        'generation-viii': generationViii.toJson(),
      };
}

class Sprites {
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });
  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json['back_default'],
        backFemale: json['back_female'],
        backShiny: json['back_shiny'],
        backShinyFemale: json['back_shiny_female'],
        frontDefault: json['front_default'],
        frontFemale: json['front_female'],
        frontShiny: json['front_shiny'],
        frontShinyFemale: json['front_shiny_female'],
        other: json['other'] == null ? null : Other.fromJson(json['other']),
        versions: json['versions'] == null ? null : Versions.fromJson(json['versions']),
        animated: json['animated'] == null ? null : Sprites.fromJson(json['animated']),
      );

  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
  final Other other;
  final Versions versions;
  final Sprites animated;

  Map<String, dynamic> toJson() => {
        'back_default': backDefault,
        'back_female': backFemale,
        'back_shiny': backShiny,
        'back_shiny_female': backShinyFemale,
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
        'other': other == null ? null : other.toJson(),
        'versions': versions == null ? null : versions.toJson(),
        'animated': animated == null ? null : animated.toJson(),
      };
}

class GenerationI {
  GenerationI({
    this.redBlue,
    this.yellow,
  });
  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json['red-blue']),
        yellow: RedBlue.fromJson(json['yellow']),
      );

  final RedBlue redBlue;
  final RedBlue yellow;

  Map<String, dynamic> toJson() => {
        'red-blue': redBlue.toJson(),
        'yellow': yellow.toJson(),
      };
}

class RedBlue {
  RedBlue({
    this.backDefault,
    this.backGray,
    this.frontDefault,
    this.frontGray,
  });
  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json['back_default'],
        backGray: json['back_gray'],
        frontDefault: json['front_default'],
        frontGray: json['front_gray'],
      );

  final String backDefault;
  final String backGray;
  final String frontDefault;
  final String frontGray;

  Map<String, dynamic> toJson() => {
        'back_default': backDefault,
        'back_gray': backGray,
        'front_default': frontDefault,
        'front_gray': frontGray,
      };
}

class GenerationIi {
  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });
  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json['crystal']),
        gold: Crystal.fromJson(json['gold']),
        silver: Crystal.fromJson(json['silver']),
      );

  final Crystal crystal;
  final Crystal gold;
  final Crystal silver;

  Map<String, dynamic> toJson() => {
        'crystal': crystal.toJson(),
        'gold': gold.toJson(),
        'silver': silver.toJson(),
      };
}

class Crystal {
  Crystal({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });
  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json['back_default'],
        backShiny: json['back_shiny'],
        frontDefault: json['front_default'],
        frontShiny: json['front_shiny'],
      );

  final String backDefault;
  final String backShiny;
  final String frontDefault;
  final String frontShiny;

  Map<String, dynamic> toJson() => {
        'back_default': backDefault,
        'back_shiny': backShiny,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };
}

class GenerationIii {
  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });
  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: Emerald.fromJson(json['emerald']),
        fireredLeafgreen: Crystal.fromJson(json['firered-leafgreen']),
        rubySapphire: Crystal.fromJson(json['ruby-sapphire']),
      );

  final Emerald emerald;
  final Crystal fireredLeafgreen;
  final Crystal rubySapphire;

  Map<String, dynamic> toJson() => {
        'emerald': emerald.toJson(),
        'firered-leafgreen': fireredLeafgreen.toJson(),
        'ruby-sapphire': rubySapphire.toJson(),
      };
}

class Emerald {
  Emerald({
    this.frontDefault,
    this.frontShiny,
  });
  factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
        frontDefault: json['front_default'],
        frontShiny: json['front_shiny'],
      );

  final String frontDefault;
  final String frontShiny;

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };
}

class GenerationVi {
  GenerationVi({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });
  factory GenerationVi.fromJson(Map<String, dynamic> json) => GenerationVi(
        frontDefault: json['front_default'],
        frontFemale: json['front_female'],
        frontShiny: json['front_shiny'],
        frontShinyFemale: json['front_shiny_female'],
      );

  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };
}

class GenerationVii {
  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });
  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json['icons']),
        ultraSunUltraMoon: GenerationVi.fromJson(json['ultra-sun-ultra-moon']),
      );

  final DreamWorld icons;
  final GenerationVi ultraSunUltraMoon;

  Map<String, dynamic> toJson() => {
        'icons': icons.toJson(),
        'ultra-sun-ultra-moon': ultraSunUltraMoon.toJson(),
      };
}

class DreamWorld {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });
  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json['front_default'],
        frontFemale: json['front_female'],
      );

  final String frontDefault;
  final dynamic frontFemale;

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_female': frontFemale,
      };
}

class GenerationViii {
  GenerationViii({
    this.icons,
  });
  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json['icons']),
      );

  final DreamWorld icons;

  Map<String, dynamic> toJson() => {
        'icons': icons.toJson(),
      };
}

class Other {
  Other({
    this.dreamWorld,
    this.officialArtwork,
  });
  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json['dream_world']),
        officialArtwork: OfficialArtwork.fromJson(json['official-artwork']),
      );

  final DreamWorld dreamWorld;
  final OfficialArtwork officialArtwork;

  Map<String, dynamic> toJson() => {
        'dream_world': dreamWorld.toJson(),
        'official-artwork': officialArtwork.toJson(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
  });
  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json['front_default'],
      );

  final String frontDefault;

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
      };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });
  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json['base_stat'],
        effort: json['effort'],
        stat: Species.fromJson(json['stat']),
      );

  final int baseStat;
  final int effort;
  final Species stat;

  Map<String, dynamic> toJson() => {
        'base_stat': baseStat,
        'effort': effort,
        'stat': stat.toJson(),
      };
}

class Type {
  Type({
    this.slot,
    this.type,
  });
  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json['slot'],
        type: Species.fromJson(json['type']),
      );

  final int slot;
  final Species type;

  Map<String, dynamic> toJson() => {
        'slot': slot,
        'type': type.toJson(),
      };
}
