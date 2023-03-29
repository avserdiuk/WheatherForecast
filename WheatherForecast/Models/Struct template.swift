////
////  Forecast.swift
////  WheatherForecast
////
////  Created by Алексей Сердюк on 27.03.2023.
////
//
//import Foundation
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let now: Int
//    let nowDt: String
//    let info: Info
//    let geoObject: GeoObject
//    let yesterday: Yesterday
//    let fact: Fact
//    let forecasts: [Forecast]
//
//    enum CodingKeys: String, CodingKey {
//        case now
//        case nowDt = "now_dt"
//        case info
//        case geoObject = "geo_object"
//        case yesterday, fact, forecasts
//    }
//}
//
//// MARK: - Fact
//struct Fact: Codable {
//    let obsTime, uptime: Int?
//    let temp, feelsLike: Int
//    let icon: Icon
//    let condition: Condition
//    let cloudness: Double
//    let precType, precProb, precStrength: Int
//    let isThunder: Bool
//    let windSpeed: Double
//    let windDir: WindDirEnum
//    let pressureMm, pressurePa, humidity: Int
//    let daytime: WindDirEnum?
//    let polar: Bool?
//    let season, source: String?
//    let soilMoisture: Double
//    let soilTemp, uvIndex: Int
//    let windGust: Double
//    let hour: String?
//    let hourTs, precMm, precPeriod: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case obsTime = "obs_time"
//        case uptime, temp
//        case feelsLike = "feels_like"
//        case icon, condition, cloudness
//        case precType = "prec_type"
//        case precProb = "prec_prob"
//        case precStrength = "prec_strength"
//        case isThunder = "is_thunder"
//        case windSpeed = "wind_speed"
//        case windDir = "wind_dir"
//        case pressureMm = "pressure_mm"
//        case pressurePa = "pressure_pa"
//        case humidity, daytime, polar, season, source
//        case soilMoisture = "soil_moisture"
//        case soilTemp = "soil_temp"
//        case uvIndex = "uv_index"
//        case windGust = "wind_gust"
//        case hour
//        case hourTs = "hour_ts"
//        case precMm = "prec_mm"
//        case precPeriod = "prec_period"
//    }
//}
//
//enum Condition: String, Codable {
//    case clear = "clear"
//    case cloudy = "cloudy"
//    case overcast = "overcast"
//    case partlyCloudy = "partly-cloudy"
//}
//
//enum WindDirEnum: String, Codable {
//    case n = "n"
//    case nw = "nw"
//    case s = "s"
//    case se = "se"
//    case sw = "sw"
//    case w = "w"
//}
//
//enum Icon: String, Codable {
//    case bknD = "bkn_d"
//    case bknN = "bkn_n"
//    case ovc = "ovc"
//    case skcD = "skc_d"
//    case skcN = "skc_n"
//}
//
//// MARK: - Forecast
//struct Forecast: Codable {
//    let date: String
//    let dateTs, week: Int
//    let sunrise, sunset, riseBegin, setEnd: String
//    let moonCode: Int
//    let moonText: String
//    let parts: Parts
//    let hours: [Fact]
//    let biomet: Biomet?
//
//    enum CodingKeys: String, CodingKey {
//        case date
//        case dateTs = "date_ts"
//        case week, sunrise, sunset
//        case riseBegin = "rise_begin"
//        case setEnd = "set_end"
//        case moonCode = "moon_code"
//        case moonText = "moon_text"
//        case parts, hours, biomet
//    }
//}
//
//// MARK: - Biomet
//struct Biomet: Codable {
//    let index: Int
//    let condition: String
//}
//
//// MARK: - Parts
//struct Parts: Codable {
//    let nightShort, evening, dayShort, morning: Day
//    let night, day: Day
//
//    enum CodingKeys: String, CodingKey {
//        case nightShort = "night_short"
//        case evening
//        case dayShort = "day_short"
//        case morning, night, day
//    }
//}
//
//// MARK: - Day
//struct Day: Codable {
//    let source: String
//    let tempMin, tempAvg, tempMax: Int?
//    let windSpeed, windGust: Double
//    let windDir: WindDirEnum
//    let pressureMm, pressurePa, humidity, soilTemp: Int
//    let soilMoisture: Double
//    let precMm, precProb, precPeriod: Int
//    let cloudness: Double
//    let precType, precStrength: Int
//    let icon: Icon
//    let condition: Condition
//    let uvIndex: Int?
//    let feelsLike: Int
//    let daytime: PurpleDaytime
//    let polar: Bool
//    let freshSnowMm: Int
//    let temp: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case source = "_source"
//        case tempMin = "temp_min"
//        case tempAvg = "temp_avg"
//        case tempMax = "temp_max"
//        case windSpeed = "wind_speed"
//        case windGust = "wind_gust"
//        case windDir = "wind_dir"
//        case pressureMm = "pressure_mm"
//        case pressurePa = "pressure_pa"
//        case humidity
//        case soilTemp = "soil_temp"
//        case soilMoisture = "soil_moisture"
//        case precMm = "prec_mm"
//        case precProb = "prec_prob"
//        case precPeriod = "prec_period"
//        case cloudness
//        case precType = "prec_type"
//        case precStrength = "prec_strength"
//        case icon, condition
//        case uvIndex = "uv_index"
//        case feelsLike = "feels_like"
//        case daytime, polar
//        case freshSnowMm = "fresh_snow_mm"
//        case temp
//    }
//}
//
//enum PurpleDaytime: String, Codable {
//    case d = "d"
//    case n = "n"
//}
//
//// MARK: - GeoObject
//struct GeoObject: Codable {
//    let district, locality, province, country: Country
//}
//
//// MARK: - Country
//struct Country: Codable {
//    let id: Int
//    let name: String
//}
//
//// MARK: - Info
//struct Info: Codable {
//    let n: Bool
//    let geoid: Int
//    let url: String
//    let lat, lon: Double
//    let tzinfo: Tzinfo
//    let defPressureMm, defPressurePa: Int
//    let slug: String
//    let zoom: Int
//    let nr, ns, nsr, p: Bool
//    let f, h: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case n, geoid, url, lat, lon, tzinfo
//        case defPressureMm = "def_pressure_mm"
//        case defPressurePa = "def_pressure_pa"
//        case slug, zoom, nr, ns, nsr, p, f
//        case h = "_h"
//    }
//}
//
//// MARK: - Tzinfo
//struct Tzinfo: Codable {
//    let name, abbr: String
//    let dst: Bool
//    let offset: Int
//}
//
//// MARK: - Yesterday
//struct Yesterday: Codable {
//    let temp: Int
//}
