//
//  QuakeCell.swift
//  SwiftQuake
//
//  Created by Stephen L. McMahon on 8/24/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

import UIKit

class QuakeCell : UITableViewCell {
    @IBOutlet var place : UILabel?
    @IBOutlet var magnitude : UILabel?
    @IBOutlet var date : UILabel?
    @IBOutlet var tsunami : UILabel?
    
    func loadQuakeDetail(detail: QuakeDetail) {
        let fmt : NSDateFormatter = NSDateFormatter()
        fmt.dateFormat = "dd-MMM-yyyy HH:mm"
        let formatted = fmt.stringFromDate(detail.dateTime)
        
        self.place?.text = detail.place
        self.date?.text = formatted
        self.tsunami?.text = detail.tsunami ? "Yes" : "No"
        self.magnitude?.text = NSString(format:"%.1f", detail.magnitude)
    }
}