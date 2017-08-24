//
//  DateTimeServices.swift
//  Almofire
//
//  Created by Admin on 8/24/17.
//  Copyright © 2017 Mujadidia Inc. All rights reserved.
//

import Foundation

class DateTimeServices{
    
    public static func getDateStringFrom(timeStamp : Double)-> String{
    
        
        
        let dateTimeStamp = NSDate(timeIntervalSince1970:timeStamp)
        
        
        let dateFormatter = DateFormatter()
       
        dateFormatter.timeZone = NSTimeZone.local //Edit
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.dateStyle = DateFormatter.Style.full
        dateFormatter.timeStyle = DateFormatter.Style.short

        
        let strDateSelect = dateFormatter.string(from: dateTimeStamp as Date) //Local time
  
        return strDateSelect
    }
    
    
}
