//
//  WeatherViewController.swift
//  rainyShineyCloudy
//
//  Created by neil mallory on 19/05/2017.
//  Copyright © 2017 neil mallory. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var forcastTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

