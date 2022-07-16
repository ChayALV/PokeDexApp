// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

class Pokemon {
    Pokemon({
       required this.abilities,
       required this.baseExperience,
       required this.forms,
       required this.gameIndices,
       required this.height,
       required this.heldItems,
       required this.id,
       required this.isDefault,
       required this.locationAreaEncounters,
       required this.moves,
       required this.name,
       required this.order,
       required this.pastTypes,
       required this.species,
       required this.sprites,
       required this.stats,
       required this.types,
       required this.weight,
    });

    final List<Ability> abilities;
    final int baseExperience;
    final List<Species> forms;
    final List<GameIndex> gameIndices;
    final int height;
    final List<HeldItem> heldItems;
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

    factory Pokemon.fromRawJson(String str) => Pokemon.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        forms: List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
        gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        heldItems: List<HeldItem>.from(json["held_items"].map((x) => HeldItem.fromJson(x))),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x.toJson())),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toJson(),
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
    };
}

class Ability {
    Ability({
       required this.ability,
       required this.isHidden,
       required this.slot,
    });

    final Species ability;
    final bool isHidden;
    final int slot;

    factory Ability.fromRawJson(String str) => Ability.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
    };
}

class Species {
    Species({
       required this.name,
       required this.url,
    });

    final String name;
    final String url;

    factory Species.fromRawJson(String str) => Species.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class GameIndex {
    GameIndex({
       required this.gameIndex,
       required this.version,
    });

    final int gameIndex;
    final Species version;

    factory GameIndex.fromRawJson(String str) => GameIndex.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromJson(json["version"]),
    );

    Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version.toJson(),
    };
}

class HeldItem {
    HeldItem({
       required this.item,
       required this.versionDetails,
    });

    final Species item;
    final List<VersionDetail> versionDetails;

    factory HeldItem.fromRawJson(String str) => HeldItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
        item: Species.fromJson(json["item"]),
        versionDetails: List<VersionDetail>.from(json["version_details"].map((x) => VersionDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "item": item.toJson(),
        "version_details": List<dynamic>.from(versionDetails.map((x) => x.toJson())),
    };
}

class VersionDetail {
    VersionDetail({
       required this.rarity,
       required this.version,
    });

    final int rarity;
    final Species version;

    factory VersionDetail.fromRawJson(String str) => VersionDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"],
        version: Species.fromJson(json["version"]),
    );

    Map<String, dynamic> toJson() => {
        "rarity": rarity,
        "version": version.toJson(),
    };
}

class Move {
    Move({
       required this.move,
       required this.versionGroupDetails,
    });

    final Species move;
    final List<VersionGroupDetail> versionGroupDetails;

    factory Move.fromRawJson(String str) => Move.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "move": move.toJson(),
        "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
    };
}

class VersionGroupDetail {
    VersionGroupDetail({
       required this.levelLearnedAt,
       required this.moveLearnMethod,
       required this.versionGroup,
    });

    final int levelLearnedAt;
    final Species moveLearnMethod;
    final Species versionGroup;

    factory VersionGroupDetail.fromRawJson(String str) => VersionGroupDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Species.fromJson(json["move_learn_method"]),
        versionGroup: Species.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod.toJson(),
        "version_group": versionGroup.toJson(),
    };
}

class GenerationV {
    GenerationV({
       required this.blackWhite,
    });

    final Sprites blackWhite;

    factory GenerationV.fromRawJson(String str) => GenerationV.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromJson(json["black-white"]),
    );

    Map<String, dynamic> toJson() => {
        "black-white": blackWhite.toJson(),
    };
}

class GenerationIv {
    GenerationIv({
       required this.diamondPearl,
       required this.heartgoldSoulsilver,
       required this.platinum,
    });

    final Sprites diamondPearl;
    final Sprites heartgoldSoulsilver;
    final Sprites platinum;

    factory GenerationIv.fromRawJson(String str) => GenerationIv.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromJson(json["heartgold-soulsilver"]),
        platinum: Sprites.fromJson(json["platinum"]),
    );

    Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
        "platinum": platinum.toJson(),
    };
}

class Versions {
    Versions({
       required this.generationI,
       required this.generationIi,
       required this.generationIii,
       required this.generationIv,
       required this.generationV,
       required this.generationVi,
       required this.generationVii,
       required this.generationViii,
    });

    final GenerationI generationI;
    final GenerationIi generationIi;
    final GenerationIii generationIii;
    final GenerationIv generationIv;
    final GenerationV generationV;
    final Map<String, Home> generationVi;
    final GenerationVii generationVii;
    final GenerationViii generationViii;

    factory Versions.fromRawJson(String str) => Versions.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(json["generation-i"]),
        generationIi: GenerationIi.fromJson(json["generation-ii"]),
        generationIii: GenerationIii.fromJson(json["generation-iii"]),
        generationIv: GenerationIv.fromJson(json["generation-iv"]),
        generationV: GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]).map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
        generationVii: GenerationVii.fromJson(json["generation-vii"]),
        generationViii: GenerationViii.fromJson(json["generation-viii"]),
    );

    Map<String, dynamic> toJson() => {
        "generation-i": generationI.toJson(),
        "generation-ii": generationIi.toJson(),
        "generation-iii": generationIii.toJson(),
        "generation-iv": generationIv.toJson(),
        "generation-v": generationV.toJson(),
        "generation-vi": Map.from(generationVi).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii.toJson(),
        "generation-viii": generationViii.toJson(),
    };
}

class Sprites {
    Sprites({
       required this.backDefault,
       required this.backFemale,
       required this.backShiny,
       required this.backShinyFemale,
       required this.frontDefault,
       required this.frontFemale,
       required this.frontShiny,
       required this.frontShinyFemale,
       required this.other,
       required this.animated,
    });

    final String backDefault;
    final String backFemale;
    final String backShiny;
    final String backShinyFemale;
    final String frontDefault;
    final String frontFemale;
    final String frontShiny;
    final String frontShinyFemale;
    final Other? other;
    final Sprites? animated;

    factory Sprites.fromRawJson(String str) => Sprites.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"]?? '',
        backFemale: json["back_female"] ?? '',
        backShiny: json["back_shiny"] ?? '',
        backShinyFemale: json["back_shiny_female"]??' ',
        frontDefault: json["front_default"],
        frontFemale: json["front_female"]?? '',
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"] ?? '',
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        animated: json["animated"] == null ? null : Sprites.fromJson(json["animated"]),
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other,
        "animated": animated,
    };
}

class GenerationI {
    GenerationI({
       required this.redBlue,
       required this.yellow,
    });

    final RedBlue redBlue;
    final RedBlue yellow;

    factory GenerationI.fromRawJson(String str) => GenerationI.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json["red-blue"]),
        yellow: RedBlue.fromJson(json["yellow"]),
    );

    Map<String, dynamic> toJson() => {
        "red-blue": redBlue.toJson(),
        "yellow": yellow.toJson(),
    };
}

class RedBlue {
    RedBlue({
       required this.backDefault,
       required this.backGray,
       required this.backTransparent,
       required this.frontDefault,
       required this.frontGray,
       required this.frontTransparent,
    });

    final String backDefault;
    final String backGray;
    final String backTransparent;
    final String frontDefault;
    final String frontGray;
    final String frontTransparent;

    factory RedBlue.fromRawJson(String str) => RedBlue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
    };
}

class GenerationIi {
    GenerationIi({
       required this.crystal,
       required this.gold,
       required this.silver,
    });

    final Crystal crystal;
    final Gold gold;
    final Gold silver;

    factory GenerationIi.fromRawJson(String str) => GenerationIi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json["crystal"]),
        gold: Gold.fromJson(json["gold"]),
        silver: Gold.fromJson(json["silver"]),
    );

    Map<String, dynamic> toJson() => {
        "crystal": crystal.toJson(),
        "gold": gold.toJson(),
        "silver": silver.toJson(),
    };
}

class Crystal {
    Crystal({
       required this.backDefault,
       required this.backShiny,
       required this.backShinyTransparent,
       required this.backTransparent,
       required this.frontDefault,
       required this.frontShiny,
       required this.frontShinyTransparent,
       required this.frontTransparent,
    });

    final String backDefault;
    final String backShiny;
    final String backShinyTransparent;
    final String backTransparent;
    final String frontDefault;
    final String frontShiny;
    final String frontShinyTransparent;
    final String frontTransparent;

    factory Crystal.fromRawJson(String str) => Crystal.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
    };
}

class Gold {
    Gold({
       required this.backDefault,
       required this.backShiny,
       required this.frontDefault,
       required this.frontShiny,
       required this.frontTransparent,
    });

    final String backDefault;
    final String backShiny;
    final String frontDefault;
    final String frontShiny;
    final String frontTransparent;

    factory Gold.fromRawJson(String str) => Gold.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent,
    };
}

class GenerationIii {
    GenerationIii({
       required this.emerald,
       required this.fireredLeafgreen,
       required this.rubySapphire,
    });

    final Emerald emerald;
    final Gold fireredLeafgreen;
    final Gold rubySapphire;

    factory GenerationIii.fromRawJson(String str) => GenerationIii.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: Emerald.fromJson(json["emerald"]),
        fireredLeafgreen: Gold.fromJson(json["firered-leafgreen"]),
        rubySapphire: Gold.fromJson(json["ruby-sapphire"]),
    );

    Map<String, dynamic> toJson() => {
        "emerald": emerald.toJson(),
        "firered-leafgreen": fireredLeafgreen.toJson(),
        "ruby-sapphire": rubySapphire.toJson(),
    };
}

class Emerald {
    Emerald({
       required this.frontDefault,
       required this.frontShiny,
    });

    final String frontDefault;
    final String frontShiny;

    factory Emerald.fromRawJson(String str) => Emerald.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class Home {
    Home({
       required this.frontDefault,
       required this.frontFemale,
       required this.frontShiny,
       required this.frontShinyFemale,
    });

    final String frontDefault;
    final String frontFemale;
    final String frontShiny;
    final String frontShinyFemale;

    factory Home.fromRawJson(String str) => Home.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"]?? '',
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"] ??'',
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
    };
}

class GenerationVii {
    GenerationVii({
       required this.icons,
       required this.ultraSunUltraMoon,
    });

    final DreamWorld icons;
    final Home ultraSunUltraMoon;

    factory GenerationVii.fromRawJson(String str) => GenerationVii.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: Home.fromJson(json["ultra-sun-ultra-moon"]),
    );

    Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
    };
}

class DreamWorld {
    DreamWorld({
       required this.frontDefault,
       required this.frontFemale,
    });

    final String frontDefault;
    final String frontFemale;

    factory DreamWorld.fromRawJson(String str) => DreamWorld.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"] ?? '',
        frontFemale: json["front_female"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
    };
}

class GenerationViii {
    GenerationViii({
       required this.icons,
    });

    final DreamWorld icons;

    factory GenerationViii.fromRawJson(String str) => GenerationViii.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json["icons"]),
    );

    Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
    };
}

class Other {
    Other({
       required this.dreamWorld,
       required this.home,
       required this.officialArtwork,
    });

    final DreamWorld dreamWorld;
    final Home home;
    final OfficialArtwork officialArtwork;

    factory Other.fromRawJson(String str) => Other.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        home: Home.fromJson(json["home"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
    );

    Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "home": home.toJson(),
        "official-artwork": officialArtwork.toJson(),
    };
}

class OfficialArtwork {
    OfficialArtwork({
       required this.frontDefault,
    });

    final String frontDefault;

    factory OfficialArtwork.fromRawJson(String str) => OfficialArtwork.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
    };
}

class Stat {
    Stat({
       required this.baseStat,
       required this.effort,
       required this.stat,
    });

    final int baseStat;
    final int effort;
    final Species stat;

    factory Stat.fromRawJson(String str) => Stat.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
    );

    Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
    };
}

class Type {
    Type({
       required this.slot,
       required this.type,
    });

    final int slot;
    final Species type;

    factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
    );

    Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
    };
}
