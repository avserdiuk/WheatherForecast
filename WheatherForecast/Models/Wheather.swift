//
//  Wheather.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 28.03.2023.
//

import Foundation

struct Wheather : Codable {
    let fact: Fact
    let forecasts : [Forecast]
}

struct Fact : Codable {
    let temp: Int
    let windSpeed: Double
    let condition: String
    let cloudness : Double // облачность
    let humidity : Double // влажность

    enum CodingKeys: String, CodingKey {
        case temp
        case windSpeed = "wind_speed"
        case condition
        case cloudness
        case humidity
    }
}

struct Forecast: Codable {
    let date : String
    let unixtime : Int
    let sunrise : String
    let sunset : String
    let parts: Parts
    let hours : [Hours]

    enum CodingKeys: String, CodingKey {
        case date
        case unixtime = "date_ts"
        case sunrise
        case sunset
        case parts
        case hours
    }
}

struct Parts: Codable {
    let night, day: Day
}

struct Day: Codable {
    let tempMin: Int
    let tempMax: Int
    let condition : String
    let precipitation : Int

    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case condition
        case precipitation = "prec_strength"
    }
}

struct Hours : Codable {
    let temp : Int
    let hour : String
    let condition : String
}

