//
//  ViewController+TableView.swift
//  Testando
//
//  Created by Jon DeMaagd on 8/23/20.
//  Copyright © 2020 JON DEMAAGD. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InventoryManager.items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! TableViewCell
        let i = InventoryManager.items[indexPath.row]
        //cell.textLabel?.text = i.name
        cell.name.text = i.name
        cell.vendorName.text = i.manufacturerName
        cell.inventory.text = String(describing: i.units)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        inventoryItem = InventoryManager.items[indexPath.row]
        self.performSegue(withIdentifier: "detailView", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            InventoryManager.items.remove(at: indexPath.row)
            tableViewMain.reloadData()
        }
    }
}
