//
//  Item.swift
//  Predicate
//
//  Created by Marek Sienczak on 17/12/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var title: String
    @Relationship(deleteRule: .nullify, inverse: \Tag.items) var tags: [Tag]?

    init(_ title: String) {
        self.title = title
    }
}

@Model
final class Tag {
    var name: String
    var items: [Item]?

    init(_ name: String) {
        self.name = name
    }
}
