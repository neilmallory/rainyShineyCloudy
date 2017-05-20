//
//  WeatherViewController.swift
//  rainyShineyCloudy
//
//  Created by neil mallory on 19/05/2017.
//  Copyright © 2017 neil mallory. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var forcastTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forcastTable.delegate = self
        forcastTable.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
}

