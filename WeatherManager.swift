//
//  WeatherManager.swift
//  Clima
//
//  Created by Ricardo Camarena on 18/10/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailedWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=d7cc2db5b9644e71e0d4de9553e89787&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)" // Adds the cityname as a parameter to the weatherURL to retrieve the weather
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)" // Adds the longitude and latitude as parameters to the weatherURL to retrieve the weather
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        // Create URL
        if let url = URL(string: urlString) {
            
            // Create URL Session
            let session = URLSession(configuration: .default)
            
            // Give session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailedWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // Start the task
            task.resume()
            
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData) // The self next to WeatherData is to tell the parameter it is a Data type rather than an object
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp) // Sets the retrieved values to the weather model object 
            return weather
            
        } catch {
            delegate?.didFailedWithError(error: error)
            return nil
        }
    }
}

