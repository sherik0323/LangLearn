//
//  LinkItem.swift
//  langLearn
//
//  Created by Sherozbek on 06/12/23.
//

import Foundation
import RealmSwift
import SwiftUI


class LinkModel : Object, Identifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var linkname: String = ""
    @Persisted var link: String = ""
    
    
    
    
    override class func primaryKey() -> String? {
        "id"
    }
}
