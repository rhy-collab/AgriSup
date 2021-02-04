//
//  ProductInfoViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 29/01/2021.
//

import UIKit

class ProductInfoViewController: UIViewController {
    
    
    var product: Product? {
        didSet{
            loadProduct()
        }
    }
    
    
    func loadProduct() {
        //load product info into the page
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
