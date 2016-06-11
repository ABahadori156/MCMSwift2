//
//  ViewController.swift
//  MCMSSwift2
//
//  Created by Pasha Bahadori on 6/11/16.
//  Copyright © 2016 Pelican Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var catNameTextField: UITextField!
    @IBOutlet weak var personalityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var magicalCreatures = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let amir = MagicalCreature(withName: "Amir")
        let salar = MagicalCreature(withName: "Salar")
        let mohammed = MagicalCreature(withName: "Mohammed")
        let vala = MagicalCreature(withName: "Vala")
        
        magicalCreatures = [amir, salar, mohammed, vala]
        
    }
    
    @IBAction func onAddCatPressed(sender: UIButton) {
//        let dvc:UIViewController = UIStoryboard(name: "CatViewController", bundle: nil).instantiateViewControllerWithIdentifier("CatViewID") as! CatViewController
//        self.presentViewController(dvc, animated: false, completion: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("CatViewID") as! CatViewController
        
        // below code is the execution to send us to CatViewController
        self.navigationController?.showViewController(vc, sender: nil)

    }
    
       
    
    

// ------------------------------------TABLEVIEW METHODS -----------------------------------------
    func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magicalCreatures.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID")
        // as! says that this is a Magical Creature, if it's anything else, xcode will crash.
        let magicalCreature = self.magicalCreatures[indexPath.row] as! MagicalCreature
        cell!.textLabel!.text = magicalCreature.name
        return cell!
        
    }


}

