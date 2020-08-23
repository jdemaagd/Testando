//
//  ViewController.swift
//  Testando
//
//  Created by Jon DeMaagd on 8/23/20.
//  Copyright © 2020 JON DEMAAGD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableViewMain: UITableView!
    
    var inventoryItem:InventoryItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tableViewMain.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        InventoryManager.init()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewMain.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailView",
            let destinationController = segue.destination as? DetailViewController {
            destinationController.inventoryItem = inventoryItem
        }
    }
}
