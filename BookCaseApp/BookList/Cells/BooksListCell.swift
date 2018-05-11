//
//  BooksListCell.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 11.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit

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
        titleLabel.text = book.title
        subtitleLabel.text = book.subtitle
        
        authorsLabel.text = book.getAuthorsAsString()
    }
    
}
