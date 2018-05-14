//
//  BooksViewModel.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 14.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation

class BooksViewModel {
    
    var list = [Book]()
    var filterCriteria: String?

    init(elements: [Book]) {
        list.append(contentsOf: elements)
    }

    var filteredList: [Book] {
        
        guard let filterCriteria = filterCriteria else {
            return list
        }

        if let bookId = Int(filterCriteria), bookId > 0 {
            return list.filter { $0.id == bookId }
        }

        if filterCriteria.count > 2 {
            return list.filter { $0.title.lowercased().contains(filterCriteria.lowercased()) }
        }

        return list.filter { $0.subtitle.lowercased().contains(filterCriteria.lowercased()) }
    }
    
}

extension BooksViewModel: Tablable {
    func getFiltredCount() -> Int {
        return filteredList.count
    }
}

extension BooksViewModel {
    
    func element(at index: Int) -> Book? {
        if index < filteredList.count {
            return filteredList[index]
        } else {
            return nil
        }
    }
    
}
