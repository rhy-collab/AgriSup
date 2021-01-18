//
//  LocationsViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 18/01/2021.
//

import UIKit

class LocationsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var things = ["Hobart", "Melbourne", "Sydney", "Perth"]
    
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = things[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)
        
        cell.textLabel?.text = message
        
        return cell
        
        
    }
}
