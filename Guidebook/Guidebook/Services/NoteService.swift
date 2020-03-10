//
//  NoteService.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/25/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation
import RealmSwift

class NoteService {
    
    static var token:NotificationToken?
    
    static func getNotes(_ placeId:String, updates: @escaping () -> Void) -> Results<Note> {
        
        // Get a reference to the realm file
        let realm = try! Realm()
        
        // Retrieve the results
        let results = realm.objects(Note.self).filter("placeId = %@", placeId).sorted(byKeyPath: "date", ascending: false)
        
        if token != nil {
            token?.invalidate()
        }
        
        token = results.observe { (changes) in
            
            switch changes {
                
            case .update:
                updates()
                break
            case .error:
                break
            case .initial:
                break
                
            }
        }
        
        // Return the results
        return results
    }
    
    static func addNote(_ n:Note) {
        
        // Get a reference to the realm file
        let realm = try! Realm()
        
        // Add the note to the realm file
        try! realm.write {
            realm.add(n)
        }
    }
}
