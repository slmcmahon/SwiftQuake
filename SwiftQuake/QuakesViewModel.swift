//
//  QuakesViewModel.swift
//  SwiftQuake
//
//  Created by Stephen McMahon on 2/24/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

public class QuakesViewModel {
    let url = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_month.geojson"
    
    public var quakes : [Quake] = []
    
    public func loadData() {
        Alamofire.request(.GET, url, parameters: nil)
            .responseJSON { response in
                if let rs = response.result.value {
                    
                    let json = JSON(rs)
                    self.quakes = Quake.load(json)!
                    print("First \(self.quakes[0].place)")
                }
        }
    }
}
