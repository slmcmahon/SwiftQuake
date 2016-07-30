//
//  QuakeCellViewModel.swift
//  SwiftQuake
//
//  Created by Stephen McMahon on 7/30/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit

class QuakeCellView : UITableViewCell {
    
    @IBOutlet var lblQuakePlace: UILabel!
    @IBOutlet var lblQuakeMagnitude : UILabel!
    @IBOutlet var lblTsunami : UILabel!
    @IBOutlet var lblDateTime : UILabel!
    
    var quake : Quake!
    
    override func layoutSubviews() {
    
        lblQuakePlace.text = quake.place
        lblQuakeMagnitude.text = "\(quake.magnitude)"
        lblTsunami.text = quake.tsunami == true ? "Yes" : "No"
        lblDateTime.text = quake.date
    }
}
