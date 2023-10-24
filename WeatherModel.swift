//
//  WeatherModel.swift
//  Clima
//
//  Created by Ricardo Camarena on 23/10/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature) // Rounds the temprature value retrieved to one decimal i.e. 30.1
    }
    
    var conditionName: String {
        switch conditionID { // Based on the conditionID, the weather icon changes to represent the actual weather
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
