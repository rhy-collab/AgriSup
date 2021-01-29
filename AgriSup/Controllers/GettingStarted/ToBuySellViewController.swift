//
//  ToBuySellViewController.swift
//  AgriSup
//
//  Created by Sonney Patel on 29/01/2021.
//

import UIKit

class ToBuySellViewController: UIViewController {

    
    @IBAction func toBuyPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segues.toCustomerStoryboard, sender: self)
    }

    
    
    @IBAction func toSellPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segues.toNameInfo, sender: self)
    }
}
