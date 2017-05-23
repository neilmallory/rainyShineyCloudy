//
//  Constants.swift
//  rainyShineyCloudy
//
//  Created by neil mallory on 20/05/2017.
//  Copyright © 2017 neil mallory. All rights reserved.
//

import Foundation


// constants used to build up open weather url
let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let LATITUDE = "?lat=52.207"
let LONGITUDE = "&lon=0.122"
let APP_ID = "&appid=a2015d62a6a4b79b8dbb50e8430825f8"
let ZERO_DEGREE_C_IN_KELVINS = Double(275.15)

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = BASE_URL+"weather"+LATITUDE+LONGITUDE+APP_ID
let FORECAST_URL = BASE_URL+"forecast/daily"+LATITUDE+LONGITUDE+"6"+APP_ID

		
