//
//  ProductCreationViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 26/01/2021.
//

import UIKit

class ProductCreationViewController: UIViewController {
    
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productDescriptionTextField: UITextField!
    @IBOutlet weak var growingMethodPicker: UISegmentedControl!
    @IBOutlet weak var sizePicker: UISegmentedControl!
    @IBOutlet weak var qualityPicker: UISegmentedControl!
    
    var productBuilder : ProductBuilder = ProductBuilder.builder
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func createProductPressed(_ sender: UIButton) {
        
        let growingMethod = growingMethodPicker.titleForSegment(at: growingMethodPicker.selectedSegmentIndex)

        let size = sizePicker.titleForSegment(at: sizePicker.selectedSegmentIndex)
        let quality = qualityPicker.titleForSegment(at: qualityPicker.selectedSegmentIndex)

        if let productName = productNameTextField.text,
           let productDesc = productDescriptionTextField.text,
           let safeGrowingMethod = growingMethod,
           let safeSize = size,
           let safeQuality = quality {
             // create product
            productBuilder.setProductDetails(name: productName, description: productDesc, growingMethod: safeGrowingMethod, size: safeSize, quality: safeQuality)
            
            self.performSegue(withIdentifier: K.Segues.toProductOrderRequirements, sender: self)
            
        }

           
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
