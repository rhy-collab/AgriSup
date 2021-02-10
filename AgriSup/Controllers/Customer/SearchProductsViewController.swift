//
//  SearchProductsViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 29/01/2021.
//

import UIKit
import Firebase

class SearchProductsViewController:  UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    var productResults : [Product] = []
    var firebaseService = FirebaseService()
    var parseHelper = ParsingHelper()
    var supplier: Supplier?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseService.searchQueryDelegate = self
        firebaseService.searchDocumentDelegate = self
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ProductInfoViewController
        if let indexpath = tableView.indexPathForSelectedRow {
            destinationVC.product = productResults[indexpath.row]
            destinationVC.supplier = self.supplier
        }
    }
    
}

//MARK: - TableView Delegates

extension SearchProductsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        firebaseService.searchSuppliers(supplierID: productResults[indexPath.row].supplierId)
    }
    
}

//MARK: - Search Bar Delegate
extension SearchProductsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            firebaseService.searchProducts(productName: searchText)
        }
    }
    
}

//MARK: - Firebase Search Delegate
extension SearchProductsViewController:  FirebaseServiceQuerySearchDelegate {
    
    func handleResult(querySnapshot: QuerySnapshot) {
        self.productResults = querySnapshot.documents.compactMap { (queryDocumentSnapshot) -> Product? in
            return try? queryDocumentSnapshot.data(as: Product.self)
        }
        
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
}

extension SearchProductsViewController: FirebaseServiceDocumentSearchDelegate {
    
    func handleResult(documentSnapshot: DocumentSnapshot) {
        self.supplier = parseHelper.parseDataToSupplier(data: documentSnapshot.data()!)
        self.performSegue(withIdentifier: "toProductInfoPage", sender: self)
    }
    
}
