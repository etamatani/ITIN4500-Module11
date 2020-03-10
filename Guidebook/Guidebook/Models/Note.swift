//
//  Note.swift
//  Guidebook
//
//  Created by Eisuke Tamatani on 1/24/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation
import RealmSwift

class Note:Object {
    
    @objc dynamic var placeId:String?
    @objc dynamic var date:String?
    @objc dynamic var text:String?
    
}
