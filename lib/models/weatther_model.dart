class Weather {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentWeather? currentWeather;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;
  DailyUnits? dailyUnits;
  Daily? daily;

  Weather(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.currentWeather,
      this.hourlyUnits,
      this.hourly,
      this.dailyUnits,
      this.daily});

  Weather.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentWeather = json['current_weather'] != null
        ? new CurrentWeather.fromJson(json['current_weather'])
        : null;
    hourlyUnits = json['hourly_units'] != null
        ? new HourlyUnits.fromJson(json['hourly_units'])
        : null;
    hourly =
        json['hourly'] != null ? new Hourly.fromJson(json['hourly']) : null;
    dailyUnits = json['daily_units'] != null
        ? new DailyUnits.fromJson(json['daily_units'])
        : null;
    daily = json['daily'] != null ? new Daily.fromJson(json['daily']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['generationtime_ms'] = this.generationtimeMs;
    data['utc_offset_seconds'] = this.utcOffsetSeconds;
    data['timezone'] = this.timezone;
    data['timezone_abbreviation'] = this.timezoneAbbreviation;
    data['elevation'] = this.elevation;
    if (this.currentWeather != null) {
      data['current_weather'] = this.currentWeather!.toJson();
    }
    if (this.hourlyUnits != null) {
      data['hourly_units'] = this.hourlyUnits!.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly!.toJson();
    }
    if (this.dailyUnits != null) {
      data['daily_units'] = this.dailyUnits!.toJson();
    }
    if (this.daily != null) {
      data['daily'] = this.daily!.toJson();
    }
    return data;
  }
}

class CurrentWeather {
  double? temperature;
  double? windspeed;
  int? winddirection;
  int? weathercode;
  int? isDay;
  String? time;

  CurrentWeather(
      {this.temperature,
      this.windspeed,
      this.winddirection,
      this.weathercode,
      this.isDay,
      this.time});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    windspeed = json['windspeed'];
    winddirection = json['winddirection'];
    weathercode = json['weathercode'];
    isDay = json['is_day'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['windspeed'] = this.windspeed;
    data['winddirection'] = this.winddirection;
    data['weathercode'] = this.weathercode;
    data['is_day'] = this.isDay;
    data['time'] = this.time;
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;
  String? rain;

  HourlyUnits({this.time, this.temperature2m, this.rain});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    rain = json['rain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m'] = this.temperature2m;
    data['rain'] = this.rain;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? temperature2m;
  List<double>? rain;

  Hourly({this.time, this.temperature2m, this.rain});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2m = json['temperature_2m'].cast<double>();
    rain = json['rain'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m'] = this.temperature2m;
    data['rain'] = this.rain;
    return data;
  }
}

class DailyUnits {
  String? time;
  String? temperature2mMax;
  String? temperature2mMin;
  String? sunrise;
  String? sunset;
  String? uvIndexMax;

  DailyUnits(
      {this.time,
      this.temperature2mMax,
      this.temperature2mMin,
      this.sunrise,
      this.sunset,
      this.uvIndexMax});

  DailyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2mMax = json['temperature_2m_max'];
    temperature2mMin = json['temperature_2m_min'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    uvIndexMax = json['uv_index_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m_max'] = this.temperature2mMax;
    data['temperature_2m_min'] = this.temperature2mMin;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['uv_index_max'] = this.uvIndexMax;
    return data;
  }
}

class Daily {
  List<String>? time;
  List<double>? temperature2mMax;
  List<double>? temperature2mMin;
  List<String>? sunrise;
  List<String>? sunset;
  List<double>? uvIndexMax;

  Daily(
      {this.time,
      this.temperature2mMax,
      this.temperature2mMin,
      this.sunrise,
      this.sunset,
      this.uvIndexMax});

  Daily.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2mMax = json['temperature_2m_max'].cast<double>();
    temperature2mMin = json['temperature_2m_min'].cast<double>();
    sunrise = json['sunrise'].cast<String>();
    sunset = json['sunset'].cast<String>();
    uvIndexMax = json['uv_index_max'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m_max'] = this.temperature2mMax;
    data['temperature_2m_min'] = this.temperature2mMin;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['uv_index_max'] = this.uvIndexMax;
    return data;
  }
}
