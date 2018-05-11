//
//  Books.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 28.04.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation


class Books: Codable {
    
    let books: [Book]
    var total: Int = 0
    
}
extension Books: Tablable {
    func getFiltredCount() -> Int {
        return total
    }
}
