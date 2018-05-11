//
//  ViewController.swift
//  BookCaseApp
//
//  Created by Kirill Khudiakov on 28.04.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {

    var tableView: UITableView!
    var viewModel: Books?
    
    convenience init(model: String) {
        self.init()
        print(model)
        let service = ServiceBook()
        
        service.load { [weak self] books in
            self?.viewModel = books
            books.getBadges().forEach {
                print($0)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
}


extension BookListViewController {
    func configureTableView() {
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.dataSource = self
        tableView.register( UINib(nibName: "BooksListCell", bundle: nil), forCellReuseIdentifier: BooksListCell.idenificator)
        tableView.separatorStyle = .none
        view.addSubview(tableView)
    }
}

extension BookListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getFiltredCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BooksListCell.idenificator) as! BooksListCell
        if let viewModel = viewModel {
            print(indexPath.row)
            if indexPath.row < viewModel.getFiltredCount() {
                let book = viewModel.books[indexPath.row]
                cell.configure(book: book)
            }
        }
        return cell
    }
    
}




