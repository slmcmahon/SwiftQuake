//
//  ViewController.swift
//  SwiftQuake
//
//  Created by Stephen L. McMahon on 8/24/14.
//  Copyright (c) 2014 Stephen L. McMahon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, QuakesViewModelProtocol {
    
    @IBOutlet var table : UITableView?
    
    var quakeData : QuakesViewModel = QuakesViewModel()

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        quakeData.delegate = self
        quakeData.loadQuakeData()
    }

    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return quakeData.quakes.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("quakeCell", forIndexPath: indexPath) as QuakeCell
        var qd = quakeData.quakes[indexPath.row] as QuakeDetail
        cell.loadQuakeDetail(qd)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        println("\(segue.identifier)")

        if (segue.identifier == "showDetail") {
            let p = self.table?.indexPathForSelectedRow()
            let row = p!.row as Int
            let q = quakeData.quakes[row] as QuakeDetail
            let vc = segue.destinationViewController as EarthQuakeDetailViewController
            vc.quakeDetail = q
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if (motion == UIEventSubtype.MotionShake) {
            quakeData.loadQuakeData()
        }
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    
    
    func quakeDataLoaded() {
        table?.reloadData()
    }
}

