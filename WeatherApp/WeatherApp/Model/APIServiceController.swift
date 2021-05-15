//
//  WebServiceController.swift
//  WeatherApp
//
//  Created by Hoshiar Sher on 5/14/21.
//

import Foundation

private enum APIKey{
    static let key = "e4e65192ffabfc9e96e33be04be1f375"
}
class APIServiceController: WebServiceViewController{
    func fetchWeatherData(for city:String, completionHandler: @escaping (String?, WebServiceViewControllerError) -> Void){
        //api.openweathermap.org/data/2.5/find?q=London&units=imperial
        let endPoint = "https://api.openweathermap.org/data/2.5/find?q=\(city)&units=imperial&appid=\(APIKey.key)"
        
        guard let safeUrlString = endPoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed), let endPointUrl = URL(string: safeUrlString) else{
            completionHandler(nil, WebServiceViewControllerError.invalidURL(endPoint))
            return
        }
        let dataTask = URLSession.shared.dataTask(with: endPointUrl) { (data, respose, error) in
            guard error == nil else{
                completionHandler(nil, WebServiceViewControllerError.forwarded(error!))
                return
            }
            
            guard let resposeData = data else {
                completionHandler(nil, WebServiceViewControllerError.invalidPayload(endPointUrl))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let weatherList = try decoder.decode(O)
            }
        }
    }
}
