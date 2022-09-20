import 'package:collection/collection.dart';

class World {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;
  int? affectedCountries;

  World({
    this.updated,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
    this.affectedCountries,
  });

  @override
  String toString() {
    return 'World(updated: $updated, cases: $cases, todayCases: $todayCases, deaths: $deaths, todayDeaths: $todayDeaths, recovered: $recovered, todayRecovered: $todayRecovered, active: $active, critical: $critical, casesPerOneMillion: $casesPerOneMillion, deathsPerOneMillion: $deathsPerOneMillion, tests: $tests, testsPerOneMillion: $testsPerOneMillion, population: $population, oneCasePerPeople: $oneCasePerPeople, oneDeathPerPeople: $oneDeathPerPeople, oneTestPerPeople: $oneTestPerPeople, activePerOneMillion: $activePerOneMillion, recoveredPerOneMillion: $recoveredPerOneMillion, criticalPerOneMillion: $criticalPerOneMillion, affectedCountries: $affectedCountries)';
  }

  factory World.fromJson(Map<String, dynamic> json) => World(
        updated: json['updated'] as int?,
        cases: json['cases'] as int?,
        todayCases: json['todayCases'] as int?,
        deaths: json['deaths'] as int?,
        todayDeaths: json['todayDeaths'] as int?,
        recovered: json['recovered'] as int?,
        todayRecovered: json['todayRecovered'] as int?,
        active: json['active'] as int?,
        critical: json['critical'] as int?,
        casesPerOneMillion: json['casesPerOneMillion'] as int?,
        deathsPerOneMillion: (json['deathsPerOneMillion'] as num?)?.toDouble(),
        tests: json['tests'] as int?,
        testsPerOneMillion: (json['testsPerOneMillion'] as num?)?.toDouble(),
        population: json['population'] as int?,
        oneCasePerPeople: json['oneCasePerPeople'] as int?,
        oneDeathPerPeople: json['oneDeathPerPeople'] as int?,
        oneTestPerPeople: json['oneTestPerPeople'] as int?,
        activePerOneMillion: (json['activePerOneMillion'] as num?)?.toDouble(),
        recoveredPerOneMillion:
            (json['recoveredPerOneMillion'] as num?)?.toDouble(),
        criticalPerOneMillion:
            (json['criticalPerOneMillion'] as num?)?.toDouble(),
        affectedCountries: json['affectedCountries'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'updated': updated,
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'todayRecovered': todayRecovered,
        'active': active,
        'critical': critical,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
        'population': population,
        'oneCasePerPeople': oneCasePerPeople,
        'oneDeathPerPeople': oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople,
        'activePerOneMillion': activePerOneMillion,
        'recoveredPerOneMillion': recoveredPerOneMillion,
        'criticalPerOneMillion': criticalPerOneMillion,
        'affectedCountries': affectedCountries,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! World) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      updated.hashCode ^
      cases.hashCode ^
      todayCases.hashCode ^
      deaths.hashCode ^
      todayDeaths.hashCode ^
      recovered.hashCode ^
      todayRecovered.hashCode ^
      active.hashCode ^
      critical.hashCode ^
      casesPerOneMillion.hashCode ^
      deathsPerOneMillion.hashCode ^
      tests.hashCode ^
      testsPerOneMillion.hashCode ^
      population.hashCode ^
      oneCasePerPeople.hashCode ^
      oneDeathPerPeople.hashCode ^
      oneTestPerPeople.hashCode ^
      activePerOneMillion.hashCode ^
      recoveredPerOneMillion.hashCode ^
      criticalPerOneMillion.hashCode ^
      affectedCountries.hashCode;
}
