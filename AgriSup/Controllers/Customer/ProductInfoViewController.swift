//
//  ProductInfoViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 29/01/2021.
//

import UIKit
import Firebase

class ProductInfoViewController: UIViewController {

    
    
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var growingMethodLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var supplierImage: UIImageView!
    @IBOutlet weak var supplierNameLabel: UILabel!
    @IBOutlet weak var supplierBusinessNameLabel: UILabel!
    @IBOutlet weak var leadTimeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var leadTimeUnitsLabel: UILabel!
    @IBOutlet weak var minOrderQuantityLabel: UILabel!
    
    @IBOutlet weak var imageStringLabel: UILabel!
    
    var firebaseService = FirebaseService()
    var parseHelper = ParsingHelper()
    
    
    //TODO preload supplier on previous page in prepare?
    var supplier: Supplier? {
        didSet {
            loadSupplier()
        }
    }

    
    var product: Product? {
        didSet{

        }
    }
    
    
    func loadProduct() {
        productNameLabel.text = product?.name
        productDescriptionLabel.text = product?.description
        growingMethodLabel.text = product?.growingMethod
        sizeLabel.text = product?.size
    }
    
    func loadSupplier() {
        supplierNameLabel.text = supplier?.firstName
        supplierBusinessNameLabel.text = supplier?.lastName //ehh wait
        leadTimeLabel.text = String((product?.leadTime!)!)
        leadTimeUnitsLabel.text = product?.leadTimeUnits!
        priceLabel.text = String((product?.unitPrice)!)
        minOrderQuantityLabel.text = String((product?.minOrderQuantity)!)
        
        
        //TODO Extract into service method call - retrievePhotos
        if let url = URL(string: (supplier?.photo[0])!) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.supplierImage.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
        imageStringLabel.text = supplier?.photo[0]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firebaseService.searchDocumentDelegate = self
        firebaseService.searchSuppliers(supplierID: product!.supplierId)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Suppliers Name is \(supplier?.firstName ?? "NONE")")
        loadProduct()
    }
    
}

extension ProductInfoViewController:  FirebaseServiceDocumentSearchDelegate{
    
    func handleResult(documentSnapshot: DocumentSnapshot) {
        self.supplier = parseHelper.parseDataToSupplier(data: documentSnapshot.data()!)
    }
}
