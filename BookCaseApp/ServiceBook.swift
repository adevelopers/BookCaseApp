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
        
        if let filePath = Bundle.main.path(forResource: "Res/books", ofType: "json") {
            let decoder = JSONDecoder()
            if let data = FileManager.default.contents(atPath: filePath) {
                do {
                    try decoder.decode(Books.self, from: data)
                }
                catch (ex) {
                    print(ex.)
                }
            }
        }
        
        
        
//        success()
    }
    
    func get(by id: Int ) {
        
    }
    
}
