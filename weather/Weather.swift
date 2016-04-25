//
//  weather.swift
//  weather
//
//  Created by 蔡智斌 on 16/4/24.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import Foundation
import Alamofire

class Weather{
    private var _weatherType: String!
    private var _temperature: Double!
    private var _weatherUrl: String!
    private var _cityId: String!
    private var _appId: String!
    
    var weatherType: String{
        return _weatherType
    }
    
    var temperature: Double{
        return _temperature
    }
    
    var cityId: String{
        return _cityId
    }
    
    var appId: String{
        return _appId
    }
    
    
    
    init(cityId: String,appId: String){
        self._cityId = CITY_ID
        self._appId = MY_APPID
        
        self._weatherUrl = "\(URL_BASE)\(CITY_ID)&\(MY_APPID)"
        //开头要加http://

    }
    
    func downloadweatherDetails(completed: DownloadComplete){
        let url = NSURL(string: _weatherUrl)!
        Alamofire.request(.GET, url).responseJSON{response in
            let result = response.result
            print(result)
            
            completed()
        
    }
  }
}
