//
//  WeatherModel.swift
//  Nimbus
//
//  Created by Евгений Овчинников on 26.10.2025.
//

import Foundation

struct WeatherModel: Decodable {
    let now: Int
    let nowDt: String
//    let info: WeatherInfo
    let fact: Fact
//    let forecast: Forecast
}

//struct WeatherInfo: Decodable {
//    let url: String
//    let lat, lon: Double
//}

struct Fact: Decodable {
    let obsTime, temp, feelsLike: Int
    let icon, condition: String
    let windSpeed: Double
    let windDir: String
    let pressure: Int
    let pressurePa: Int
    let humidity: Int
    let dayTime: String
    let polar: Bool
    let season: String
    let windGust: Double
    
    init(obsTime: Int,
         temp: Int,
         feelsLike: Int,
         icon: String,
         condition: String,
         windSpeed: Double,
         windDir: String,
         pressure: Int,
         pressurePa: Int,
         humidity: Int,
         dayTime: String,
         polar: Bool,
         season: String,
         windGust: Double) {
        self.obsTime = obsTime
        self.temp = temp
        self.feelsLike = feelsLike
        self.icon = icon
        self.condition = condition
        self.windSpeed = windSpeed
        self.windDir = windDir
        self.pressure  = pressure
        self.pressurePa = pressurePa
        self.humidity = humidity
        self.dayTime = dayTime
        self.polar = polar
        self.season = season
        self.windGust = windGust
    }
}

//struct Forecast: Decodable {
//    let date: String
//    let dateTs: Int
//    let week: Int
//    let sunrise: String
//    let sunset: String
//    let moonCode: Int
//    let moonText: String
//    let parts: [Parts]
//}

//struct Parts: Decodable {
//    let partName: String
//    let tempMin: Int
//    let tempAvg: Int
//    let tempMax: Int
//    let windSpeed: Double
//    let windGust: Double
//    let windDir: String
//    let pressure: Int
//    let pressurePa: Int
//    let humidity: Int
//    let prec: Int
//    let precProb: Int
//    let precPeriod: Int
//    let icon: String
//    let condition: String
//    let feelsLike: Int
//    let daytime: String
//    let polar: Bool
//}
