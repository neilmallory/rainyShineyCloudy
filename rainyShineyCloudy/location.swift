//
//  location.swift
//  rainyShineyCloudy
//
//  Created by neil mallory on 23/05/2017.
//  Copyright © 2017 neil mallory. All rights reserved.
//

import Foundation
import CoreLocation

class Location{
    static var sharedInstance = Location()
    private init(){
        latitude=0.0
        longitude=0.0
    }
    
    var latitude: Double!
    var longitude: Double!
    
    
    
}
