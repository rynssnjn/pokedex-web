extension MapExtension on Map {
  String get specieUrl => this['species']['url'].toString();
  String get specieName => this['species']['name'].toString();
  Map<String, dynamic> get middleSpecie => this['evolves_to'][0] as Map<String, dynamic>;
}

extension StringExt on String {
  // Color get colorValue {
  //   switch (this) {
  //     case 'grass':
  //       return grass;
  //     case 'fire':
  //       return fire;
  //     case 'water':
  //       return water;
  //     case 'normal':
  //       return normal;
  //     case 'flying':
  //       return flying;
  //     case 'bug':
  //       return bug;
  //     case 'poison':
  //       return poison;
  //     case 'electric':
  //       return electric;
  //     case 'ground':
  //       return ground;
  //     case 'fighting':
  //       return fighting;
  //     case 'psychic':
  //       return psychic;
  //     case 'rock':
  //       return rock;
  //     case 'ice':
  //       return ice;
  //     case 'ghost':
  //       return ghost;
  //     case 'dragon':
  //       return dragon;
  //     case 'dark':
  //       return dark;
  //     case 'steel':
  //       return steel;
  //     case 'fairy':
  //       return fairy;
  //     default:
  //       return defaultColor;
  //   }
  // }

  String get specieNumber {
    final text = this;
    return text.replaceAll('https://pokeapi.co/api/v2/pokemon-species/', '').replaceAll('/', '');
  }
}
