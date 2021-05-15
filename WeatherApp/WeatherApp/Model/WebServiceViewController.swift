//
//  WebServiceViewController.swift
//  WeatherApp
//
//  Created by Hoshiar Sher on 5/14/21.
//

import Foundation


public enum WebServiceViewControllerError: Error{
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}

public protocol WebServiceViewController{
    func fetchWeatherData(for city:String, completionHandler: (String?, WebServiceViewControllerError) -> Void)
}
