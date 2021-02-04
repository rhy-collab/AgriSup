//
//  SearchProductsViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 29/01/2021.
//

import UIKit
import Firebase

class SearchProductsViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var db = Firestore.firestore()
    var productResults : [Product] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableCell", for: indexPath)
        
        if productResults.count > 0 {
            let product = productResults[indexPath.row]
            cell.textLabel?.text = product.name + "-" + product.growingMethod
        } else {
            cell.textLabel?.text = "No products found matching description"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toProductInfoPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ProductInfoViewController
        if let indexpath = tableView.indexPathForSelectedRow {
            destinationVC.product = productResults[indexpath.row]
        }
    }
    
    
}

extension SearchProductsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("search bar button clicked")
        //get the data
        
        let productRef = db.collection(K.productCollection)
        
        if let searchText = searchBar.text {
            productRef
                .whereField("name", isEqualTo: searchText)
                .getDocuments { (querySnapshot, error) in
                    if let err = error {
                        print("There was an error retrieving documents \(err)")
                    } else {
                        self.productResults = []
                        for document in querySnapshot!.documents {
                            print(document.data())
                            let product = self.parseData(data: document.data())
                            self.productResults.append(product)
                            
                        }
                        
                        print(self.productResults)
                        DispatchQueue.main.async{
                            self.tableView.reloadData()
                        }
                    }
                }
        }
    }
    
    
    func parseData(data: [String: Any]) -> Product {
        let supplierID = data["supplierId"] as! String
        let name = data["name"] as! String
        let description = data["description"] as! String
        let growingMethod = data["growingMethod"] as! String
        let size = data["size"] as! String
        let unit = data["unit"] as! String
        let minOrderQuantity = data["minOrderQuantity"] as! Int
        let leadTime = data["leadTime"] as! Int
        let leadTimeUnits = data["leadTimeUnits"] as! String
        let samples = data["samples"] as! Bool
        let sampleUnits = data["sampleUnits"] as! Int
        let unitPrice = data["unitPrice"] as! Double
        
        return Product(supplierId: supplierID, name: name, description: description, growingMethod: growingMethod, size: size, unit: unit, minOrderQuantity: minOrderQuantity, leadTime: leadTime, leadTimeUnits: leadTimeUnits, samples: samples, sampleUnits: sampleUnits, unitPrice: unitPrice)
    }
    
    
    
}
