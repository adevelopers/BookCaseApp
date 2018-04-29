//
//  ViewController.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 28.04.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {

    
    convenience init(model: String) {
        self.init()
        print(model)
        let service = ServiceBook()
        service.load { books in
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor.white
    }

}

