//
//  WeatherModel.swift
//  Nimbus
//
//  Created by Евгений Овчинников on 26.10.2025.


import Foundation

struct WeatherModel: Codable {
    let now: Int
    let nowDT: String
    let info: WeatherInfo
    let fact: Fact
    let forecast: Forecast

    enum CodingKeys: String, CodingKey {
        case now
        case nowDT = "now_dt"
        case info
        case fact
        case forecast
    }
}

// MARK: - Info
struct WeatherInfo: Codable {
    let url: String
    let lat, lon: Double
}

// MARK: - Fact
struct Fact: Codable {
    let obsTime: Int
    let temp, feelsLike: Int
    let icon, condition: String
    let windSpeed: Double
    let windDir: String
    let pressureMM, pressurePA, humidity: Int
    let daytime: String
    let polar: Bool
    let season: String
    let windGust: Double

    enum CodingKeys: String, CodingKey {
        case obsTime = "obs_time"
        case temp
        case feelsLike = "feels_like"
        case icon, condition
        case windSpeed = "wind_speed"
        case windDir = "wind_dir"
        case pressureMM = "pressure_mm"
        case pressurePA = "pressure_pa"
        case humidity, daytime, polar, season
        case windGust = "wind_gust"
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let date: String
    let dateTS: Int
    let week: Int
    let sunrise, sunset: String
    let moonCode: Int
    let moonText: String
    let parts: [ForecastPart]

    enum CodingKeys: String, CodingKey {
        case date
        case dateTS = "date_ts"
        case week, sunrise, sunset
        case moonCode = "moon_code"
        case moonText = "moon_text"
        case parts
    }
}

// MARK: - ForecastPart
struct ForecastPart: Codable {
    let partName: String
    let tempMin, tempAvg, tempMax: Int
    let windSpeed, windGust: Double
    let windDir: String
    let pressureMM, pressurePA, humidity: Int
    let precMM: Double
    let precProb, precPeriod: Int
    let icon, condition: String
    let feelsLike: Int
    let daytime: String
    let polar: Bool

    enum CodingKeys: String, CodingKey {
        case partName = "part_name"
        case tempMin = "temp_min"
        case tempAvg = "temp_avg"
        case tempMax = "temp_max"
        case windSpeed = "wind_speed"
        case windGust = "wind_gust"
        case windDir = "wind_dir"
        case pressureMM = "pressure_mm"
        case pressurePA = "pressure_pa"
        case humidity
        case precMM = "prec_mm"
        case precProb = "prec_prob"
        case precPeriod = "prec_period"
        case icon, condition
        case feelsLike = "feels_like"
        case daytime, polar
    }
}
