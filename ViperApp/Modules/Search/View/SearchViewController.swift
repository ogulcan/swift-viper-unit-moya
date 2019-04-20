//
//  SearchViewController.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    var presenter: ViewToPresenterSearchProtocol?
    var listItems: [Actor] = []
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            self.searchBar.delegate = self
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: ListCell.reuseID)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        self.addNavigationItem()
    }
    
    private func addNavigationItem() {
        let searchBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: nil, action: #selector(closeTapped))
        searchBarButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = searchBarButtonItem
    }
    
    @objc func closeTapped() {
        
    }
}

extension SearchViewController: PresenterToViewSearchProtocol {
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showError(with message: String?) {
        
    }
    
    func showItems(with items: [Codable]) {
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
