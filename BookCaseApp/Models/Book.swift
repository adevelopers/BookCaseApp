//
//  Book.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 28.04.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation

class Cover: Codable {
    let small: String = ""
    let large: String = ""
}

class Author: Codable {
    let name: String = ""
}

class Files: Codable {
    let ebook: Bool = false
}

class Book: Codable {
    
    let id: Int = 0
    let title: String = ""
    let subtitle: String = ""
    let bookPartLink: String = ""
    let badges: [String] = []
    let similarBooks: [String] = []
    let nav: String = ""
//    let cover: Cover?
    let authors: [Author] = []
//    let files: Files?
    
}
