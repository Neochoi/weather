//
//  ViewController.swift
//  weather
//
//  Created by 蔡智斌 on 16/4/22.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var weathertype: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    
    var weather: Weather!
    override func viewDidLoad() {
        super.viewDidLoad()
        weather = Weather(cityId: "id=2172797", appId: "APPID=9a262618d061858c4d1d1aea98c11ac7")
        weather.downloadweatherDetails{ () -> () in
            
        }
    }
}

