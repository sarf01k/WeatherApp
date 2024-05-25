class Weather {
  String? queryCost;
  dynamic latitude;
  dynamic longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  dynamic tzoffset;
  String? description;
  List<Day>? days;
  List<dynamic>? alerts;
  DGAA? stations;
  CurrentConditions? currentConditions;

  Weather({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.description,
    this.days,
    this.alerts,
    this.stations,
    this.currentConditions,
  });

  factory Weather.fromJSON(Map<String, dynamic> json) {
    return Weather(
        queryCost: json['queryCost'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        resolvedAddress: json['resolvedAddress'],
        address: json['address'],
        timezone: json['timezone'],
        tzoffset: json['tzoffset'],
        description: json['description'],
        days: json['days'],
        alerts: json['alerts'],
        stations: json['stations'],
        currentConditions: json['currentConditions']);
  }
}

class Day {
  String? datetime;
  dynamic datetimeEpoch;
  dynamic tempmax;
  dynamic tempmin;
  dynamic temp;
  dynamic feelslikemax;
  dynamic feelslikemin;
  dynamic feelslike;
  dynamic dew;
  dynamic humidity;
  dynamic precip;
  dynamic precipprob;
  dynamic precipcover;
  List<String>? preciptype;
  dynamic snow;
  dynamic snowdepth;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic cloudcover;
  dynamic visiblity;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  dynamic severerisk;
  String? sunrise;
  dynamic sunriseEpoch;
  String? sunset;
  dynamic sunsetEpoch;
  dynamic moonphase;
  String? conditions;
  String? description;
  String? icon;
  List<String>? stations;
  String? source;
  List<Hour>? hours;

  Day({
    this.datetime,
    this.datetimeEpoch,
    this.tempmax,
    this.tempmin,
    this.temp,
    this.feelslikemax,
    this.feelslikemin,
    this.feelslike,
    this.dew,
    this.humidity,
    this.precip,
    this.precipprob,
    this.precipcover,
    this.preciptype,
    this.snow,
    this.snowdepth,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.cloudcover,
    this.visiblity,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.severerisk,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.conditions,
    this.description,
    this.icon,
    this.stations,
    this.source,
    this.hours,
  });

  factory Day.fromJSON(Map<String, dynamic> json) {
    return Day(
        datetime: json['datetime'],
        datetimeEpoch: json['datetimeEpoch'],
        tempmax: json['tempmax'],
        tempmin: json['tempmin'],
        temp: json['temp'],
        feelslikemax: json['feelslikemax'],
        feelslikemin: json['feelslikemin'],
        feelslike: json['feelslike'],
        dew: json['dew'],
        humidity: json['humidity'],
        precip: json['precip'],
        precipprob: json['precipprob'],
        precipcover: json['precipcover'],
        preciptype: json['preciptype'],
        snow: json['snow'],
        snowdepth: json['snowdepth'],
        windgust: json['windgust'],
        windspeed: json['windspeed'],
        winddir: json['winddir'],
        pressure: json['pressure'],
        cloudcover: json['cloudcover'],
        visiblity: json['visiblity'],
        solarradiation: json['solarradiation'],
        solarenergy: json['solarenergy'],
        uvindex: json['uvindex'],
        severerisk: json['severerisk'],
        sunrise: json['sunrise'],
        sunriseEpoch: json['sunriseEpoch'],
        sunset: json['sunset'],
        sunsetEpoch: json['sunsetEpoch'],
        moonphase: json['moonphase'],
        conditions: json['conditions'],
        description: json['description'],
        icon: json['icon'],
        stations: json['stations'],
        source: json['source'],
        hours: json['hours']);
  }
}

class Hour {
  String? datetime;
  dynamic datetimeEpoch;
  dynamic temp;
  dynamic feelslike;
  dynamic humidity;
  dynamic dew;
  dynamic precip;
  dynamic precipprob;
  dynamic snow;
  dynamic snowdepth;
  List<String>? preciptype;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic visiblity;
  dynamic cloudcover;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  dynamic severerisk;
  String? conditions;
  String? icon;
  List<String>? stations;
  String? obs;

  Hour({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.preciptype,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visiblity,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.severerisk,
    this.conditions,
    this.icon,
    this.stations,
    this.obs,
  });

  factory Hour.fromJSON(Map<String, dynamic> json) {
    return Hour(
      datetime: json['datetime'],
      datetimeEpoch: json['datetimeEpoch'],
      temp: json['temp'],
      feelslike: json['feelslike'],
      humidity: json['humidity'],
      dew: json['dew'],
      precip: json['precip'],
      precipprob: json['precipprob'],
      snow: json['snow'],
      snowdepth: json['snowdepth'],
      windgust: json['windgust'],
      windspeed: json['windspeed'],
      winddir: json['winddir'],
      pressure: json['pressure'],
      visiblity: json['visiblity'],
      cloudcover: json['cloudcover'],
      solarradiation: json['solarradiation'],
      solarenergy: json['solarenergy'],
      uvindex: json['uvindex'],
      severerisk: json['severerisk'],
      conditions: json['conditions'],
      icon: json['icon'],
      stations: json['stations'],
      obs: json['obs'],
    );
  }
}

class CurrentConditions {
  String? datetime;
  dynamic datetimeEpoch;
  dynamic temp;
  dynamic feelslike;
  dynamic humidity;
  dynamic dew;
  dynamic precip;
  dynamic precipprob;
  dynamic snow;
  dynamic snowdepth;
  dynamic windgust;
  dynamic windspeed;
  dynamic winddir;
  dynamic pressure;
  dynamic visibilty;
  dynamic cloudcover;
  dynamic solarradiation;
  dynamic solarenegy;
  dynamic uvindex;
  String? conditions;
  String? icon;
  List<String>? stations;
  String? source;
  String? sunrise;
  dynamic sunriseEpoch;
  String? sunset;
  dynamic sunsetEpoch;
  dynamic moonphase;

  CurrentConditions({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibilty,
    this.cloudcover,
    this.solarradiation,
    this.solarenegy,
    this.uvindex,
    this.conditions,
    this.icon,
    this.stations,
    this.source,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
  });

  factory CurrentConditions.fromJSON(Map<String, dynamic> json) {
    return CurrentConditions(
        datetime: json['datetime'],
        datetimeEpoch: json['datetimeEpoch'],
        temp: json['temp'],
        feelslike: json['feelslike'],
        humidity: json['humidity'],
        dew: json['dew'],
        precip: json['precip'],
        precipprob: json['precipprob'],
        snow: json['snow'],
        snowdepth: json['snowdepth'],
        windgust: json['windgust'],
        windspeed: json['windspeed'],
        winddir: json['winddir'],
        pressure: json['pressure'],
        visibilty: json['visibilty'],
        cloudcover: json['cloudcover'],
        solarradiation: json['solarradiation'],
        solarenegy: json['solarenegy'],
        uvindex: json['uvindex'],
        conditions: json['conditions'],
        icon: json['icon'],
        stations: json['stations'],
        source: json['source'],
        sunrise: json['sunrise'],
        sunriseEpoch: json['sunriseEpoch'],
        sunset: json['sunset'],
        sunsetEpoch: json['sunsetEpoch'],
        moonphase: json['moonphase']);
  }
}

class DGAA {
  dynamic distance;
  dynamic latitude;
  dynamic longitude;
  dynamic useCount;
  String? id;
  String? name;
  dynamic quality;
  dynamic contribution;

  DGAA(
      {this.distance,
      this.latitude,
      this.longitude,
      this.useCount,
      this.id,
      this.name,
      this.quality,
      this.contribution});

  factory DGAA.fromJSON(Map<String, dynamic> json) {
    return DGAA(
        distance: json['distance'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        useCount: json['useCount'],
        id: json['id'],
        name: json['name'],
        quality: json['quality'],
        contribution: json['contribution']);
  }
}
