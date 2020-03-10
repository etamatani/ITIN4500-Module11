//
//  Place.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/24/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation
import RealmSwift

class Place: Object {
    
    @objc dynamic var placeId:String?
    @objc dynamic var name:String?
    @objc dynamic var address:String?
    @objc dynamic var summary:String?
    @objc dynamic var lat:Double = 0
    @objc dynamic var long:Double = 0
    @objc dynamic var filename:String?
    
}
