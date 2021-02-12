//
//  SearchResultsTableViewCell.swift
//  AgriSup
//
//  Created by Sonney Patel on 12/02/2021.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var orderQuantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        moreInfoButton.layer.cornerRadius = moreInfoButton.frame.size.height / 3
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func moreInfoPressed(_ sender: UIButton) {
    }
    
}
