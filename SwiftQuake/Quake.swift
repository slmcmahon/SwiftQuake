//
//  Quake.swift
//  SwiftQuake
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Quake {
    public let magnitude : Double!
    public let place : String!
    public let tsunami : Bool!
    public let date : String!
    public let latitude : Double!
    public let longitude : Double!
    
    init(data : JSON) {
        
        let props = data["properties"]
        let geo = data["geometry"]["coordinates"]
        
        magnitude = props["mag"].doubleValue
        place = props["place"].stringValue
        tsunami = props["tsunami"].boolValue
        date = Quake.getDateString(props["time"].doubleValue)
        latitude = geo[0].doubleValue
        longitude = geo[1].doubleValue
    }
    
    private static func getDateString(epoch : Double) -> String! {
        let date = NSDate(timeIntervalSince1970: epoch/1000)
        
        
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd-MMM-yyyy HH:mm"
        
        
        return dayTimePeriodFormatter.stringFromDate(date)
    }
    
    public static func parse(quakeData : JSON) -> [Quake]? {
        return quakeData["features"].arrayValue.map { Quake(data: $0) }
    }
}