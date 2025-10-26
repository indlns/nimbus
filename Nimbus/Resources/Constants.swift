//
//  Constants.swift
//  Nimbus
//
//  Created by Евгений Овчинников on 26.10.2025.
//

import Foundation

struct Constants {
    enum API {
        static let baseURL = "https://api.weather.yandex.ru/v2/informers?lat=56.838011&lon=60.597465"
        static let apiKey = "YOUR_API_KEY"
    }
    
    enum Weather {
        static let degreeSymbol = "°C"
    }
}
