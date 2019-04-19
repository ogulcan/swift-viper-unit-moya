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
    
    @IBOutlet weak var tableView: UITableView!
    
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
