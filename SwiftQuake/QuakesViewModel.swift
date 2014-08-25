//
//  QuakesViewModel.swift
//  SwiftQuake
//
//  Created by Stephen L. McMahon on 8/24/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

import Foundation

protocol QuakesViewModelProtocol {
    func quakeDataLoaded()
}

class QuakesViewModel {
    
    var quakes : NSArray

    init() {
        self.quakes = NSArray();
    }
    
    var delegate : QuakesViewModelProtocol?
    
    func loadQuakeData() {
        let manager = AFHTTPRequestOperationManager();
        manager.GET("http://earthquake.usgs.gov/earthquakes/feed/v0.1/summary/significant_month.geojson",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) -> Void in
                self.quakes = QuakeDetail.parseQuakeData(responseObject as NSDictionary);
                self.delegate?.quakeDataLoaded()
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println("\(error.localizedDescription)")
        }
    }
}