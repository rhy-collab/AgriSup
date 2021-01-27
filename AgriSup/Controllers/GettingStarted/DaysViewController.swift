//
//  TestViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 18/01/2021.
//

import UIKit

class DaysViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var supplierBuilder = SupplierBuilder.builder
    
    var daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday","Friday","Saturday", "Sunday"]
    
    override func viewDidLoad() {
        tableView.dataSource = self
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        var selectedDays: [String] = []
        let cells = self.tableView.visibleCells
        for cell in cells {
            if cell.isSelected {
                selectedDays.append((cell.textLabel?.text!)!)
            }
        }
        
        if selectedDays.isEmpty {
            errorPopUpDisplayed("Please select at least one day")
        } else {
            supplierBuilder.setDeliveryDates(deliveryDates: selectedDays)
            self.performSegue(withIdentifier: K.Segues.toDeliveryCityInfo, sender: self)
        }
        
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
    }
    
}



//MARK: - Extension Table Source
extension DaysViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysOfWeek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = daysOfWeek[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)
        
        cell.textLabel?.text = message
        
        return cell
        
        
    }
    
}
