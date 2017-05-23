//
//  CurrentWeather.swift
//  rainyShineyCloudy
//
//  Created by neil mallory on 20/05/2017.
//  Copyright © 2017 neil mallory. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather  {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String{
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String{
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double{
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete)  {
        
        // alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON {response in
            let result = response.result
            //print(response)
            
            // retreived data from response
            if let dict = result.value as? Dictionary<String, Any>{
                
                // get city name
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                // get weather type
                if let weather = dict["weather"] as? [Dictionary<String, Any>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
            
                // get temperature
                if let main = dict["main"] as? Dictionary<String, Any> {
                    if let tempKelvin = main["temp"] as? Double {
                        let tempCelcius = tempKelvin - ZERO_DEGREE_C_IN_KELVINS
                        self._currentTemp = ((tempCelcius*10).rounded())/10
                    }
                }
            }
            
            // DEBUG
            //print("city name = \(self.cityName)")
            //print("weather type = \(self.weatherType)")
            //print("temp = \(self.currentTemp)")
        
            completed()
        }
        
        //completed()
    }
    
}
