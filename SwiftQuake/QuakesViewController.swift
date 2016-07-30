//
//  ViewController.swift
//  SwiftQuake
//
//  Created by Stephen McMahon on 2/24/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit

class QuakesViewController: UIViewController {

    @IBOutlet var lblTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let m = QuakesViewModel();
        m.loadData();
        
    }
}

