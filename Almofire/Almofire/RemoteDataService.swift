//
//  RemoteDataService.swift
//  Almofire
//
//  Created by Admin on 8/24/17.
//  Copyright © 2017 Mujadidia Inc. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

protocol RemoteDataServiceProtocol : class{
    
    func sentResponse(response : Response)
}


class RemoteDataService {

    var delegate : RemoteDataServiceProtocol!
    
    public func getDataFromWeatherApi(){
        
        
        Alamofire.request(
            URL(string: "http://api.openweathermap.org/data/2.5/forecast/daily")!,
            method: .get,
            parameters: ["lat": "24.8615" ,  "lon":"67.0099" , "cnt":"7", "appid":"f17343a3d33e260e98ebe282d99050af"]).validate().responseJSON { (response) in
                if(response.result.isSuccess){
                    
                    let data =  response.result.value as! [String : Any]
                    let  weatherData = WeatherData(JSON: data)
                    let resp = Response(status: true, weatherData: weatherData)
                    self.delegate.sentResponse(response: resp)
                    print( response.result.value! )
                    
                }
                else {
                    
                    let resp = Response(status: false, weatherData: nil)
                    self.delegate.sentResponse(response: resp)
                }
        }
    
    }


}
