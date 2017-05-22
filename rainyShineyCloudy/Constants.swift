//
//  Constants.swift
//  rainyShineyCloudy
//
//  Created by neil mallory on 20/05/2017.
//  Copyright © 2017 neil mallory. All rights reserved.
//

import Foundation


// constants used to build up open weather url
let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let APP_KEY = "b1b15e88fa797225412429c1c50c122a1"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = BASE_URL+LATITUDE+"52.21"+LONGITUDE+"0.11"+APP_ID+APP_KEY


		
