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
    private var _temperature: String!
    private var _weatherUrl: String!
    private var _cityId: String!
    private var _appId: String!
    private var _day: String!
    private var _date: String!
    private var _time: String!
    private var _mainDesc: String!
    private var _detailDesc: String!
    private var _icon: String!
    
    var detailDesc:String{
        get{
            if _detailDesc == nil{
                return ""
            }
            return _detailDesc
        }
    }
    
    var mainDesc: String{
        get{
            if _mainDesc == nil{
                return ""
            }
            return _mainDesc
        }
    }
    
    var weatherType: String{
        return _weatherType
    }
    
    var icon: String{
        get{
            if _icon == nil{
                return ""
            }
            
            return _icon
        }
    }
    
    var temperature: String{
        get{
            if _temperature == nil{
                return  ""
            }
            return _temperature
        }
        
    }
    
    var cityId: String{
        return _cityId
    }
    
    var appId: String{
        return _appId
    }
    
    var day: String{
        get{
            if _day == nil {
                return "" }
            return _day
            
        }
    }
    
    var date: String{
        get{
            if _date == nil {
                return "" }
            return _date
            
        }
    }
    
    var time: String{
        get{
            if _time == nil {
                return "" }
            return _time
            
        }
    }
        
    init(cityId: String,appId: String){
        self._cityId = CITY_ID
        self._appId = MY_APPID
        
        self._weatherUrl = "\(URL_BASE)\(_cityId)&\(_appId)&\(UNITS)"
        //开头要加http://

    }
//    func citySearch(completed: DownloadComplete){
//        let path = NSBundle.mainBundle().pathForResource("city.list", ofType: "json")!
//        Alamofire.request(.GET, path).responseJSON{response in
//            let result = response.result
//            
//            
//        }
//    }
//    
    func downloadweatherDetails(completed: DownloadComplete){
        let url = NSURL(string: self._weatherUrl)!
        Alamofire.request(.GET, url).responseJSON{response in
            let result = response.result
            print(result)
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let dt = dict["dt"] as? Double{
                    let date = NSDate(timeIntervalSince1970: dt)
                    let timeForMatter = NSDateFormatter()
                    let dayForMatter = NSDateFormatter()
                    let dateForMatter = NSDateFormatter()
                    timeForMatter.dateFormat = "hh:mm:ss a"
                    dayForMatter.dateFormat = "EEEE"
                    dateForMatter.dateStyle = NSDateFormatterStyle.LongStyle
                    self._day = dayForMatter.stringFromDate(date)
                    self._time = timeForMatter.stringFromDate(date)
                    self._date = dateForMatter.stringFromDate(date)
                    
                    print(self._day)
                    print(self._time)
                    print(self._date)
                }
                
                if let weatherDesc = dict["weather"] as? [Dictionary<String,AnyObject>] where weatherDesc.count > 0{
                    if let mainDesc = weatherDesc[0]["main"] as? String{
                        self._mainDesc = mainDesc
                    }
                    
                    if let detailDesc = weatherDesc[0]["description"] as? String{
                        self._detailDesc = detailDesc
                    }
                    
                    if let icon = weatherDesc[0]["icon"] as? String{
                        self._icon = icon
                    }
                }
            print(self._detailDesc)
            print(self._mainDesc)
            print(self._icon)
                
                
                if let temp = dict["main"] as? Dictionary<String,AnyObject> {
                    if let tempadv = temp["temp"] as? Double{
                        self._temperature = NSString(format: "%.2f", tempadv) as String
                        print(self._temperature)
                    }
                }
                
            }
            
            
         
            
            
            completed()
        
    }

  }
}
