//
//  ViewController.swift
//  MCMSSwift2
//
//  Created by Pasha Bahadori on 6/11/16.
//  Copyright © 2016 Pelican Inc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var creatureNameTextField: UITextField!
    @IBOutlet weak var personalityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var magicalCreatures = []
    var creaturesArray = []
    var creaturesImageArray = []
    var creatureFound: Bool?
    
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let amir = MagicalCreature(withName: "Amir")
        let salar = MagicalCreature(withName: "Salar")
        let mohammed = MagicalCreature(withName: "Mohammed")
        let vala = MagicalCreature(withName: "Vala")
        
        creaturesArray = [amir, salar, mohammed, vala]
        
    }

    func loadFetchRequest{
        
    }
    
    
    
    @IBAction func onAddCatPressed(sender: AnyObject) {
        
//            let creature = NSEntityDescription.insertNewObjectForEntityForName("Creature", inManagedObjectContext: self.managedObjectContext) as! Creature
//        creature.creatureName = name
        let creature = NSEntityDescription.entityForName("Creature", inManagedObjectContext: moc)
        let saveCreature = Creature(entity: creature!, insertIntoManagedObjectContext: moc)
        
        let img1 = UIImage(named: "cat1")
        let img2 = UIImage(named: "cat2")
        let img3 = UIImage(named: "cat3")
        let img4 = UIImage(named: "cat4")
        let img5 = UIImage(named: "cat5")
        let imgData1 = UIImageJPEGRepresentation(img1!, 1)
        let imgData2 = UIImageJPEGRepresentation(img2!, 1)
        let imgData3 = UIImageJPEGRepresentation(img3!, 1)
        let imgData4 = UIImageJPEGRepresentation(img4!, 1)
        let imgData5 = UIImageJPEGRepresentation(img5!, 1)
        
        creaturesImageArray = [imgData1!, imgData2!, imgData3!, imgData4!, imgData5!]
        
        saveCreature.creatureName = creatureNameTextField.text!
        saveCreature.creatureImage = imgData1
        
        do {
            try moc.save()
            creatureNameTextField.text = ""
            Alert.show("Success", message: "Your Creature is Saved", vc: self)
            
        } catch let error as NSError {
             Alert.show("Failed", message: "Failed to Save Creature", vc: self)
            
        }

        
        creatureNameTextField.resignFirstResponder()
        personalityTextField.resignFirstResponder()
        personalityTextField.text = nil

    }


// ------------------------------------TABLEVIEW METHODS -----------------------------------------
    func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magicalCreatures.count
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("CatViewID") as! CatViewController
        
        // below code is the execution to send us to CatViewController
        self.navigationController?.showViewController(vc, sender: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID")
        // as! says that this is a Magical Creature, if it's anything else, xcode will crash.
        let magicalCreature = self.magicalCreatures[indexPath.row] as! MagicalCreature
        cell!.textLabel!.text = magicalCreature.name
        return cell!
    
    }


}

