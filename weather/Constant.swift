//
//  Constant.swift
//  weather
//
//  Created by 蔡智斌 on 16/4/24.
//  Copyright © 2016年 NeoChoi. All rights reserved.
//

import Foundation

//http://api.openweathermap.org/data/2.5/weather?id=1787075&appid=9a262618d061858c4d1d1aea98c11ac7&units=metric



let URL_BASE = "http://api.openweathermap.org/data/2.5/weather?"

let CITY_ID = "id=1787075"

let MY_APPID = "appid=9a262618d061858c4d1d1aea98c11ac7"

let UNITS = "units=metric"

typealias DownloadComplete = () -> ()
