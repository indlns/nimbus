//
//  ApiServices.swift
//  Nimbus
//
//  Created by Евгений Овчинников on 26.10.2025.
//

import Foundation

class ApiServices: NSObject {
    func getWeatherData(completion : @escaping (WeatherModel) -> ()) {
        var request = URLRequest(url: URL(string: Constants.API.baseURL)!)
        request.httpMethod = "GET"
        request.addValue(Constants.API.apiKey, forHTTPHeaderField: "X-Yandex-API-Key")
        
        URLSession.shared.dataTask(with: request) { (data, urlResponce, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let weatherData = try jsonDecoder.decode(WeatherModel.self,
                                                         from: data)
                    
                    DispatchQueue.main.async {
                        completion(weatherData)
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
