//
//  WeatherData.swift
//  Clima
//
//  Created by Ricardo Camarena on 22/10/2023.
//  Copyright © 2023 Ricardo Camarena. All rights reserved.
//

import Foundation

// Match de variable (propoerties) names with the names of the JSON data
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}
