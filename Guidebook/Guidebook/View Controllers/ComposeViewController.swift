//
//  ComposeViewController.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/24/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var place:Place?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        
        guard place != nil else {
            return
        }
        
        // Create the note
        var note = Note()
        note.text = textView.text
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy - h:mm a"
        
        note.date = formatter.string(from: Date())
        note.placeId = place!.placeId!
        
        // Save the note
        NoteService.addNote(note)
        
        // Dismiss the view controller
        dismiss(animated: false, completion: nil)
        
    }
    
}
