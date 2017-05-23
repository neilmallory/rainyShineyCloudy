//
//  WeatherTableViewCell.swift
//  rainyShineyCloudy
//
//  Created by neil mallory on 23/05/2017.
//  Copyright © 2017 neil mallory. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var tempHighLabel: UILabel!
    @IBOutlet weak var tempLowLabel: UILabel!
    
    func configureCell(forecast: Forcast){
        weatherImage.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
        weatherTypeLabel.text = forecast.weatherType
        tempHighLabel.text = forecast.highTemp
        tempLowLabel.text = forecast.lowTemp
        
    }
}
