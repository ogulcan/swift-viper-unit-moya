//
//  SearchViewController.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class SearchViewController: UIViewController {
    
    var presenter: ViewToPresenterSearchProtocol?
    var listItems: [Actor] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            self.searchBar.delegate = self
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        self.addNavigationItem()
    }
    
    private func addNavigationItem() {
        let searchBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeTapped))
        searchBarButtonItem.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = searchBarButtonItem
    }
    
    @objc func closeTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SearchViewController: PresenterToViewSearchProtocol {
    
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showError(with message: String?) {
        SVProgressHUD.showError(withStatus: "An error occured")
    }
    
    func showItems(with items: [Codable]) {
        self.listItems = items as! [Actor]
        //self.tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(at: indexPath) as ListCell
        cell.set(for: self.listItems[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter?.textChanged(to: searchText)
    }
}
