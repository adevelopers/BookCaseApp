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
        print("try to load\n\n")
        
        if let filePath = Bundle.main.path(forResource: "books", ofType: "json") {
            let decoder = JSONDecoder()
            if let data = FileManager.default.contents(atPath: filePath) {
                do {
                    let books = try decoder.decode(Books.self, from: data)
                    
                    success(books)
                    print("Data loaded...")
                    books.dump()
                }
                catch {
                    print("\n\(#function)\n", error.localizedDescription)
                }
            }
        }

    }
    
}
