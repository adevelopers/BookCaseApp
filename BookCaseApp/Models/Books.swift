//
//  Books.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 28.04.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation

class Books: Codable {
    
    var books: [Book] = []
    var total: Int = 0
    
}

extension Books {
    func getBadges() -> [String] {
        return Array(Set(books.flatMap { $0.badges }))
    }
    
    func dump() {
        print("books count -> ", books.count)
    }
}
