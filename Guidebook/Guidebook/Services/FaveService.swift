//
//  FaveService.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/25/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation
import RealmSwift

class FaveService {
    
    static var fave:Fave = {
        
        // Get a reference to the default realm
        let realm = try! Realm()
        
        // Try to get the fave object
        var f = realm.objects(Fave.self).first
        
        if f != nil {
            //We've found the fave object in th edefault realm
            return f!
        }
        else {
            // There;s no fave object in the default realm
            f = Fave()
            
            // Add the new Fave object to the default realm
            try!realm.write {
                realm.add(f!)
            }
            
            return f!
        }
    }()
    
    static func getFavePlace() -> Results<Place> {
        
        // Get a reference to the place realm file
        let realm = try! Realm(configuration: Constants.RealmConfig.placeConfig)
        
        let results = realm.objects(Place.self).filter("placeId IN %@", fave.favePlaceIds)
        
        return results
    }
    
    static func toggleFave(_ placeId:String) {
        
        // Get a reference to the default realm
        let realm = try! Realm()
        
        // Check if this placeId is in the faves lost
        let index = fave.favePlaceIds.index(of: placeId)
        
        try! realm.write {

            if index == nil {
                fave.favePlaceIds.insert(placeId, at: 0)
            }
            else {
                fave.favePlaceIds.remove(at: index!)
            }
        }
        
    }
}
