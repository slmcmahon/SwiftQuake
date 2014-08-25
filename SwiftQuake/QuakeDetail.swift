//
//  QuakeDetail.swift
//  SwiftQuake
//
//  Created by Stephen L. McMahon on 8/24/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

import Foundation

class QuakeDetail {
    var place : String
    var dateTime : NSDate
    var magnitude : Float
    var tsunami : Bool
    
    init (place : String, dateTime : NSDate, magnitude : Float, tsunami : Bool) {
        self.place = place
        self.dateTime = dateTime
        self.magnitude = magnitude
        self.tsunami = tsunami
    }
    
    class func parseQuakeData(data : NSDictionary) -> NSArray {
        let features : NSArray = data["features"] as NSArray
        var tmp = NSMutableArray()
        for feature in features {
            let props = feature["properties"] as NSDictionary
            let place_ = props["place"] as String
            let mag_ = props["mag"] as Float
            
            var strTsu = (props["tsunami"] as NSObject == NSNull()) ? "0" : props["tsunami"] as String
            
            let tsu_ = (strTsu.isEmpty || strTsu == "0") ? false : true;
            let tmpTime = (props["time"]).floatValue / 1000;
            let time_ = NSDate(timeIntervalSince1970: NSTimeInterval(tmpTime))
            
            let q = QuakeDetail(place: place_, dateTime: time_, magnitude: mag_, tsunami:tsu_);
            tmp.addObject(q);
        }
        return tmp as NSArray;
    }
}
