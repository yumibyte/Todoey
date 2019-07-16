//
//  Category.swift
//  Todoey
//
//  Created by Ashley Raigosa on 7/14/19.
//  Copyright © 2019 Ashley Raigosa. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
