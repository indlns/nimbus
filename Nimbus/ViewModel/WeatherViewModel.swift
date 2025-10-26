//
//  WeatherViewModel.swift
//  Nimbus
//
//  Created by Евгений Овчинников on 26.10.2025.
//

import Foundation

class WeatherViewModel: NSObject {
    
    private var apiService: ApiServices!
    
    private(set) var weatherData: WeatherModel? {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = ApiServices()
        getWeatherData()
    }
    
    func getWeatherData() {
        self.apiService.getWeatherData { [weak self] weatherData in
            self?.weatherData = weatherData
        }
    }
}
