//
//  PlaceService.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/24/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation
import RealmSwift

class PlaceService {
    
    static func getPlaces() -> Results<Place> {
        
        // Get a reference to the place.realm file
        let realm = try! Realm(configuration: Constants.RealmConfig.placeConfig)
        
        // Get the places and return them
        return realm.objects(Place.self)
        
    }
}
