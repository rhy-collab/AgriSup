//
//  ReuseableCheckboxCell.swift
//  AgriSup
//
//  Created by Sonney Patel on 18/01/2021.
//

import UIKit

class ReuseableCheckboxCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
