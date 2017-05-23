//
//  WeatherViewController.swift
//  rainyShineyCloudy
//
//  Created by neil mallory on 19/05/2017.
//  Copyright © 2017 neil mallory. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var forcastTable: UITableView!
    
    var currentWeather: CurrentWeather!
    var forcast: Forcast!
    var forecasts = [Forcast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forcastTable.delegate = self
        forcastTable.dataSource = self
        
        // create instances
        currentWeather = CurrentWeather()
        
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    func downloadForecastData(completed: @escaping DownloadComplete){
        // down load the forcast data for the table view
        
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON(completionHandler: { response in
            let result = response.result
         
            if let dict = result.value as? Dictionary<String, Any>{
                if let list = dict["list"] as? [Dictionary<String,Any>]{
                    for obj in list {
                        let forcast = Forcast(weatherDict: obj)
                        self.forecasts.append(forcast)
                    }
                    
                }
                self.forecasts.remove(at: 0)
                self.forcastTable.reloadData()
            }
            
            completed()
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableViewCell{
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherTableViewCell()
        }
        
    }
    
    func updateMainUI(){
        dateLabel.text = currentWeather.date
        temperatureLabel.text = String(currentWeather.currentTemp)
        locationLabel.text = currentWeather.cityName
        weatherLabel.text = currentWeather.weatherType
        weatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
}

