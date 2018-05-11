//
//  ServiceBook.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 28.04.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation

class ServiceBook {
    
    var isLoaded: Bool = false
    
    func load(success: (Books)->Void) {
        print("try to load")
        
        if let filePath = Bundle.main.path(forResource: "books", ofType: "json") {
            print(filePath)
            print("\n")
            let decoder = JSONDecoder()
            if let data = FileManager.default.contents(atPath: filePath) {
                do {
                    let books = try decoder.decode(Books.self, from: data)
                    print(books.total)
                    success(books)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }

    }
    
}
