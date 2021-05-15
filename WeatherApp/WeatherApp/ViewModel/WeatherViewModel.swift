//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Hoshiar Sher on 5/15/21.
//

import Foundation


class WeatherViewModel: ObservableObject {
    private let weatherService = APIServiceController()
    
    @Published  var weatherInfo = ""
    
    func fetch(city: String){
        weatherService.fetchWeatherData(for: city) { (info, error) in
            guard error == nil, let weatherInfo = info else{
                DispatchQueue.main.async{
                    self.weatherInfo = "Could not retrive weather info for \(city)"
                }
                return
            }
            
            DispatchQueue.main.async {
                self.weatherInfo = weatherInfo
            }
        }
    }
}
