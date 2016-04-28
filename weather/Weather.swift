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
    private var _tempMax: String!
    private var _tempMin: String!
    private var _weatherUrl: String!
    private var _cityId: String!
    private var _appId: String!
    private var _day: String!
    private var _date: String!
    private var _time: String!
    private var _mainDesc: String!
    private var _detailDesc: String!
    private var _icon: String!
    private var _cityName: String!
    
    private var _sunset: String!
    private var _sunrise: String!
   
    var sunset: String{
        get{
            if _sunset == nil{
                return  ""
            }
            return _sunset
            
        }
        
    }
    
    var sunrise: String{
        get{
            if _sunrise == nil{
                return  ""
            }
            return _sunrise
            
        }
        
    }
    
    var cityName: String{
        get{
            if _cityName == nil{
                return ""
            }
            return _cityName
        }
    }
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
    
    var tempMax: String{
        get{
            if _tempMax == nil{
                return  ""
            }
            return _tempMax
        }
        
    }
    var tempMin: String{
        get{
            if _tempMin == nil{
                return  ""
            }
            return _tempMin
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
                
                if let sunSys = dict["sys"] as? Dictionary<String,AnyObject>{
                    if let sunSet = sunSys["sunset"] as? Double{
                        let sunset = NSDate(timeIntervalSince1970: sunSet)
                        let sunsetForMatter = NSDateFormatter()
                        sunsetForMatter.dateFormat = "hh:mm a"
                        self._sunset = sunsetForMatter.stringFromDate(sunset)
                    }
                    if let sunRise = sunSys["sunrise"] as? Double{
                        let sunrise = NSDate(timeIntervalSince1970: sunRise)
                        let sunriseForMatter = NSDateFormatter()
                        sunriseForMatter.dateFormat = "hh:mm a"
                        self._sunrise = sunriseForMatter.stringFromDate(sunrise)
                        
                    }
                    
                }
                if let cityName = dict["name"] as? String{
                    
                     self._cityName = cityName
                    print(self._cityName)
                }
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
                    if let tempMax = temp["temp_max"] as? Double{
                        self._tempMax = NSString(format: "%.2f", tempMax) as String
                        print(self._tempMax)
                    }
                    if let tempMin = temp["temp_min"] as? Double{
                        self._tempMin = NSString(format: "%.2f", tempMin) as String
                        print(self._tempMin)
                    }
                    
                }
                
            }
            
            
         
            
            
            completed()
        
    }

  }
}
