//
//  PlaceCell.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/24/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var placeImageView: UIImageView!
    
    var place:Place?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showPlace(_ p: Place) {
        
        place = p
        
        // Set the label for tje place
        nameLabel.text = p.name
        
        // Set the image for the place
        placeImageView.image = UIImage(named: p.filename!)
    }

}
