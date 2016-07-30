//
//  QuakesViewModel.swift
//  SwiftQuake
//
//  Created by Stephen McMahon on 2/24/16.
//  Copyright © 2016 Stephen McMahon. All rights reserved.
//

import SwiftyJSON
import Alamofire

public class QuakesViewModel {
    
    public var quakes : [Quake] = []
    
    public init(onComplete:() -> Void, onError:(message : String!) -> Void) {
        Alamofire.request(.GET, Constants.QuakesUrl, parameters: nil)
            .responseJSON { response in
                if let rs = response.result.value {
                    let json = JSON(rs)
                    self.quakes = Quake.parse(json)!
                    onComplete()
                } else {
                    onError(message: "Failed to load quake data.")
                }
        }
    }
}
