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
    
    init(data : JSON) {
        
        let props = data["properties"];
        magnitude = props["mag"].double ?? 0
        place = props["place"].string ?? ""
    }
    
    public static func parse(quakeData : JSON) -> [Quake]? {
        return quakeData["features"].arrayValue.map({Quake(data: $0)})
    }
}