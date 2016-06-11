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
        
        let employee = NSEntityDescription.insertNewObjectForEntityForName("Employee", inManagedObjectContext: self.managedObjectContext) as! AAAEmployeeMO
        
        
        
        
//        if (self.catFound == NO) {
//            self.catToBeSaved = [NSEntityDescription insertNewObjectForEntityForName:@"Cat" inManagedObjectContext:self.moc];
//            self.catToBeSaved.name = self.nameTextField.text;
//            self.catToBeSaved.breed = self.breedTextField.text;
//            self.catToBeSaved.color = self.colorTextField.text;
//        }
//        
//        [self.selectedOwner addCatsObject:self.catToBeSaved];
//        //    [self.selectedOwner addSuggestedBooksObject:self.catToBeSaved];
//        [self saveCats];
//        [self.nameTextField endEditing:YES];
//        [self.breedTextField endEditing:YES];
//        [self.colorTextField endEditing:YES];
//        
//        self.nameTextField.text = nil;
//        self.breedTextField.text = nil;
//        self.colorTextField.text = nil;
//        
//        
//        [self dismissViewControllerAnimated:YES completion:nil];
//        NSLog(@"CAT ADDED");

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

