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
        
        _ = QuakesViewModel(onComplete: quakesLoaded, onError: loadFailed);
    }
    
    private func quakesLoaded(quakes : [Quake]) {
        lblTest.text = quakes[0].place
        for q in quakes {
            print("\(q.place)")
        }
    }
    
    private func loadFailed(message : String!) {
        lblTest.text = message
        print("Error message: \(message)")
    }
}

