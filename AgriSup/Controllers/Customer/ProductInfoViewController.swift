//
//  ProductInfoViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 29/01/2021.
//

import UIKit

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
    
    var supplier: Supplier?
    var product: Product?
    var photoService = PhotoService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoService.photoServiceDelegate = self
        loadProduct()
        loadSupplier()
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
        photoService.retrievePhoto(from: (supplier?.photo[0])!)
        imageStringLabel.text = supplier?.photo[0]
        
    }

}

//MARK: - PhotoServiceDelegate

extension ProductInfoViewController : PhotoServiceDelegate {
    
    func handleResult(data: Data) {
        self.supplierImage.image = UIImage(data: data)
    }
    
}
