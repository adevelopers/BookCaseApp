//
//  BooksListCell.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 11.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit
import Kingfisher

class BooksListCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(book: Book) {
        backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.3333333333, blue: 0.3450980392, alpha: 1)
        titleLabel.text = book.title
        subtitleLabel.text = book.subtitle
        
        if
            let cover = book.cover,
            let url = URL(string: cover.small)
        {
            print("id:", book.id)
            let resource = ImageResource(downloadURL: url, cacheKey: "key_\(book.id)")
            thumbnailImageView.kf.setImage(with: resource)
        }
        authorsLabel.text = book.getAuthorsAsString()
    }
    
}
