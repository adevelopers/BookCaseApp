//
//  Book.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 28.04.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation

class Cover: Codable {
    var small: String = ""
    var large: String = ""
}

class Author: Codable {
    var name: String = ""
}

class Files: Codable {
    let ebook: Bool = false
}

class Book: Codable {
    
    var id: Int = 0
    var title: String = ""
    var subtitle: String = ""
    let bookPartLink: String = ""
    var badges: [String] = []
    let similarBooks: [String] = []
    var nav: String = ""
    var cover: Cover?
    var authors: [Author] = []
//    let files: Files?
    
}

extension Book {
    func getAuthorsAsString() -> String {
        var authorsString = ""
        authors.forEach {
            authorsString.append( $0.name )
        }
        return authorsString
    }
}

