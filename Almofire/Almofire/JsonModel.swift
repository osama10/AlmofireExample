//
//  Model.swift
//  Almofire
//
//  Created by Admin on 8/22/17.
//  Copyright © 2017 Mujadidia Inc. All rights reserved.
//

import Foundation
import ObjectMapper

struct WeatherData : Mappable{
    
    var city : City?
    var code : String?
    var message : Double?
    var cnt : Int?
    var weatherDataList : [Details]?
    
    init?(map: Map)  {
        
        
        
    }
    
    mutating func mapping(map: Map) {
        
        city <- map["city"]
        code <- map["cod"]
        message <- map["message"]
        cnt <- map["cnt"]
        weatherDataList <- map["list"]
    }
    
    
}

struct City : Mappable{
    
    var id : Int?
    var name : String?
    var coordinate : Coordinate?
    var country : String?
    var population : Int?
    
    init?(map: Map)  {
        
 
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        coordinate <- map["coord"]
        country <- map["country"]
        population <- map["population"]
        
    }
    
    
}


struct Coordinate : Mappable{
    
    var lat : Double?
    var lon : Double?
    
    
    init?(map: Map)  {
        
        
        
    }
    
    mutating func mapping(map: Map) {
        
        lat <- map["lat"]
        lon <- map["lon"]
    }
    
    
}


struct Details : Mappable{
    
    var dt : Int?
    var temp : Temperature?
    var pressure : Double?
    var humidity : Int?
    var weatherList : [Weather]?
    var speed : Double?
    var deg : Int?
    var clouds : Int?
    
    init?(map: Map)  {
        
        
        
    }
    
    mutating func mapping(map: Map) {
        
        dt <- map["dt"]
        temp <- map["temp"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        weatherList <- map["weather"]
        speed <- map["speed"]
        deg <- map["deg"]
        clouds <- map["clouds"]
    }
    
    
}


struct Temperature : Mappable{
    
    var day : Double?
    var min : Double?
    var max : Double?
    var night : Double?
    var eve : Double?
    var morn : Double?
    
    init?(map: Map)  {
        
        
        
    }
    
    mutating func mapping(map: Map) {
        
        day <- map["day"]
        min <- map["min"]
        max <- map["max"]
        night <- map["night"]
        eve <- map["eve"]
        morn <- map["morn"]
    }
    
    
}


struct Weather : Mappable{
    
    var id : Int?
    var main : String?
    var description : String?
    var icon : String?
    
    init?(map: Map)  {
        
        
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
        
    }
    
    
}




