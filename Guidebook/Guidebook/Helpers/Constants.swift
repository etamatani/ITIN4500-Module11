//
//  Constants.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/24/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation
import RealmSwift

struct Constants {
    
    struct Storyboard {
        
        static let detailSegue = "toDetail"
        
        static let placeCellId = "PlaceCell"
        static let noteCellId = "NoteCell"
        
        static let notesViewController = "NotesViewController"
        static let ComposeViewController = "ComposeViewController"
        static let MapViewController = "MapViewController"
        
    }
    
    struct RealmConfig {
        
        static let placeConfig = Realm.Configuration(fileURL: Bundle.main.url(forResource: "Place", withExtension: "realm"), inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: true, schemaVersion: 0, migrationBlock: nil, deleteRealmIfMigrationNeeded: false, shouldCompactOnLaunch: nil, objectTypes: nil)
        
    }
}
