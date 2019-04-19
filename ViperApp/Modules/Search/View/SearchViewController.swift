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
