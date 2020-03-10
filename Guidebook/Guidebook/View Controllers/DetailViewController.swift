//
//  DetailViewController.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/24/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var placeImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    
    var place:Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Check if a place has been set
        if place != nil {
            showPlace(place!)
        }
    }
    
    func showPlace(_ p: Place) {
        
        // Set the labels
        nameLabel.text = p.name
        addressLabel.text = p.address
        summaryLabel.text = p.summary
        placeImageView.image = UIImage(named: p.filename!)
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func notesTapped(_ sender: UIButton) {
        
        let notesVC = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.notesViewController) as? NotesViewController
        
        if let notesVC = notesVC {
            
            // Set the place property
            notesVC.place = place
            
            // Present the view controller
            present(notesVC, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func mapTapped(_ sender: UIButton) {
        
        let mapVC = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.MapViewController) as? MapViewController
        
        if let mapVC = mapVC {
            
            // Set the property
            mapVC.place = place
            
            // Present the view controller
            present(mapVC, animated: true, completion: nil)
        }
    }
    
    

}
