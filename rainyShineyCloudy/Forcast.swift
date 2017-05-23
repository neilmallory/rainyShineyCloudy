//
//  Forcast.swift
//  rainyShineyCloudy
//
//  Created by neil mallory on 22/05/2017.
//  Copyright © 2017 neil mallory. All rights reserved.
//

import Foundation
import Alamofire

class Forcast{
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, Any>){
        
        if let temp = weatherDict["temp"] as? Dictionary<String, Any>{
            if let min = temp["min"] as? Double{
                self._lowTemp = String(((min - ZERO_DEGREE_C_IN_KELVINS)*10).rounded()/10)
            }
            if let max = temp["max"] as? Double{
                self._highTemp = String(((max - ZERO_DEGREE_C_IN_KELVINS)*10).rounded()/10)
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, Any>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        
        if let dt = weatherDict["dt"] as? Double{
            let unixConvertedDate = Date(timeIntervalSince1970: dt)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
       
}

extension Date{
    func dayOfTheWeek()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
