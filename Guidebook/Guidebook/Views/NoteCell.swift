//
//  NoteCell.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/25/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var noteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showNote(_ n: Note) {
        
        // Configure the labels
        dateLabel.text = n.date
        noteLabel.text = n.text
        
    }

}
