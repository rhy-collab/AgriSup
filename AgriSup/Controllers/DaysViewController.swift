//
//  DaysViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 18/01/2021.
//

import UIKit

class DaysViewController: UIViewController{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This loaded")

        tableView.dataSource = self
    }
}


extension DaysViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(days.count)
        return days.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let day = days[indexPath.row]
        print("Let this get called please")
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)

        cell.textLabel?.text = day
        return cell
    }
}
