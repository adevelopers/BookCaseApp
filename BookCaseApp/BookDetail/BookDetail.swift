//
//  BookDetail.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 11.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit
import Kingfisher

class BookDetail: UIViewController {
    
    var viewModel: Book!
    var coverImageView: UIImageView!
    
    convenience init(book: Book) {
        self.init()
        viewModel = book
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
    override func viewDidLoad() {
        coverImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        if
            let cover = viewModel.cover,
            let url = URL(string: cover.large)
        {
            let resource = ImageResource(downloadURL: url, cacheKey: "large_\(viewModel.id)")
            coverImageView.kf.setImage(with: resource)
            view.addSubview(coverImageView)
            coverImageView.center = view.center
        }
        
        let tap = UIGestureRecognizer(target: self, action: #selector(close))
        view.addGestureRecognizer(tap)
    }
    
    @objc func close() {
        navigationController?.popViewController(animated: true)
    }
    
}



