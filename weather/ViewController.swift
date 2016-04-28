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
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temp_max: UILabel!
    @IBOutlet weak var temp_min: UILabel!
    
    @IBOutlet weak var sunSet: UILabel!
    
    @IBOutlet weak var daydate: UILabel!
    @IBOutlet weak var sunRise: UILabel!
    @IBOutlet weak var time: UILabel!
    
    var weather: Weather!
    override func viewDidLoad() {
        super.viewDidLoad()
        weather = Weather(cityId: "id=2172797", appId: "APPID=9a262618d061858c4d1d1aea98c11ac7")
        weather.downloadweatherDetails{ () -> () in
            self.updataUI()
            
        }
    }
    
    func updataUI(){
        weathertype.text = weather.mainDesc
        temperature.text = weather.temperature
        cityName.text = weather.cityName
        temp_max.text = weather.tempMax
        temp_min.text = weather.tempMin
        sunSet.text = weather.sunset
        sunRise.text = weather.sunrise
        
        daydate.text = " \(weather.date)"
        time.text = "\(weather.time)  \(weather.day)"

        weatherImage.image = UIImage(named: weather.icon)//要把weather.icon作为名字找到图片
        if weatherImage.image == nil{
            weatherImage.image = UIImage(named: "unknow")
        }
    }
}

