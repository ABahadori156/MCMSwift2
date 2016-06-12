//
//  Alert.swift
//  MCMSSwift2
//
//  Created by Pasha Bahadori on 6/11/16.
//  Copyright © 2016 Pelican Inc. All rights reserved.
//

import UIKit
class Alert: NSObject {
    
    // Create the controller
    static func show(title:String, message:String, vc:UIViewController) {
    let alertCT = UIAlertController(title: title, message: message, preferredStyle:  UIAlertControllerStyle.Alert)
    //create Alert Action
    
    let okAc = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) { (alert:UIAlertAction) -> Void in
        
        alertCT.dismissViewControllerAnimated(true, completion: nil)
                }

// Add Alert Actions to Alert Controller
alertCT.addAction(okAc)

// Display Alert Controller
vc.presentViewController(alertCT, animated: true, completion: nil)

        }
}