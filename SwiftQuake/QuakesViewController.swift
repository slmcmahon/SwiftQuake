//
//  ViewController.swift
//  SwiftQuake
//
//  Created by Stephen McMahon on 2/24/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import UIKit

class QuakesViewController: UITableViewController {
    
    var viewModel : QuakesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        
        viewModel = QuakesViewModel(onComplete: quakesLoaded, onError: loadFailed);
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel!.quakes.count)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "QuakeCell"
        var cell: QuakeCellView! = tableView.dequeueReusableCellWithIdentifier(cellId) as! QuakeCellView!
        
        if (cell == nil) {
            cell = QuakeCellView(style: .Default, reuseIdentifier: cellId)
        }
        
        cell.quake = viewModel?.quakes[indexPath.row]
        
        return cell as UITableViewCell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    private func quakesLoaded() {
        self.tableView.reloadData()
    }
    
    private func loadFailed(message : String!) {
        print("Error message: \(message)")
    }
}

