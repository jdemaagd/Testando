//
//  AddViewController.swift
//  Testando
//
//  Created by Jon DeMaagd on 8/23/20.
//  Copyright © 2020 JON DEMAAGD. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var model: UITextField!
    @IBOutlet var units: UITextField!
    @IBOutlet var make: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
        
       return true
    }
    

    @IBAction func addButton_click(_ sender: AnyObject) {
        let modelText = model.text!
        let unitsText = Int(units.text!)!
        let makeText = make.text!
        let dateText = String(describing: Date())
        
        let item = InventoryItem(name: modelText, units: unitsText, manufacturerName: makeText, dateAdded: dateText)
        
        InventoryManager.add(item: item)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
