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
    @IBOutlet weak var priceTextField: UITextField!
    
    var productBuilder : ProductBuilder = ProductBuilder.builder
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func createProductPressed(_ sender: UIButton) {
        
        let growingMethod = growingMethodPicker.titleForSegment(at: growingMethodPicker.selectedSegmentIndex)

        let size = sizePicker.titleForSegment(at: sizePicker.selectedSegmentIndex)
        
        let price = Double(priceTextField.text!) ?? 0.0

        if let productName = productNameTextField.text,
           let productDesc = productDescriptionTextField.text,
           let safeGrowingMethod = growingMethod,
           let safeSize = size {
             // create product
            productBuilder.setProductDetails(name: productName, description: productDesc, growingMethod: safeGrowingMethod, size: safeSize, price: price)
            
            self.performSegue(withIdentifier: K.Segues.toProductOrderRequirements, sender: self)
            
        } else  {
            errorPopUpDisplayed("One or more fields are missing values, please try again")
        }

           
    }
    
    func errorPopUpDisplayed(_ text: String) {
        let popUpWindow = PopUpWindow(title: "Error in sign up", text: text, buttontext: "OK")
        self.present(popUpWindow, animated: true, completion: nil)
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
