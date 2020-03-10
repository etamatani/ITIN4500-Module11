//
//  NotesViewController.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/24/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    var place: Place?
    var notes:Results<Note>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if place != nil {
            
            // Set the title
            navBar.topItem?.title = place!.name
            
            // Getting the notes
            notes = NoteService.getNotes(place!.placeId!, updates: {
                
                // Notes result set has updated so reload the table view
                self.tableView.reloadData()
                
            })
        }
        
        // Configure the tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set dynamic cell height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        
        // Dissmiss the view controller
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func composeTapped(_ sender: UIBarButtonItem) {
        
        // Create a new compose voew controller and present it
        let composeVC = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.ComposeViewController) as? ComposeViewController
        
        if let composeVC = composeVC {
    
            // Set the place property
            composeVC.place = place
            
            // Set the presentation mode
            composeVC.modalPresentationStyle = .overCurrentContext
            
            // Present it
            present(composeVC, animated: false, completion: nil)
        }
    }
    
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes != nil ? notes!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Storyboard.noteCellId, for: indexPath) as! NoteCell
        
        // Get note
        let n = notes![indexPath.row]
        
        // Show the note
        cell.showNote(n)
        
        return cell
        
    }
}
