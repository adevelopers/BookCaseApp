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
    var customSearchBar: UITextField!
    var viewModel: BooksViewModel?
    
    convenience init(model: String) {
        self.init()
        print(model)
        let service = ServiceBook()
        
        service.load { [weak self] books in
            self?.viewModel = BooksViewModel(elements: books.books)
            books.getBadges().forEach {
                print($0)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchBar()
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
}

extension BookListViewController {
    func configureTableView() {
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
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
        cell.selectionStyle = .none
        if let viewModel = viewModel {
            if indexPath.row < viewModel.getFiltredCount() {
                let book = viewModel.filteredList[indexPath.row]
                cell.configure(book: book)
            }
        }
        return cell
    }
    
}

extension BookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewModel = viewModel {
            let book = viewModel.filteredList[indexPath.row]
            let bookDetailViewController = BookDetail(book: book)
            navigationController?.pushViewController(bookDetailViewController, animated: true)
            
        }
    }
}


// MARK: - Search Bar
extension BookListViewController {
    func configureSearchBar() {
        let offset = (navigationController?.navigationBar.intrinsicContentSize.height ?? 0)  + UIApplication.shared.statusBarFrame.height
        customSearchBar = UITextField(frame: CGRect(x: 10, y: 10, width: view.frame.width - 20, height: 44))
        customSearchBar.textColor = .white
        customSearchBar.textAlignment = .center
        customSearchBar.layer.borderColor = UIColor.white.cgColor
        customSearchBar.layer.borderWidth = 1
        customSearchBar.center.y += offset
        customSearchBar.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged )
        customSearchBar.delegate = self
        view.addSubview(customSearchBar)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if let count = textField.text?.count, count > 0{
            viewModel?.filterCriteria = textField.text
        } else {
            viewModel?.filterCriteria = nil
        }
        
        tableView.reloadData()
    }
}

extension BookListViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        customSearchBar.endEditing(true)
        return false
    }
    
}

