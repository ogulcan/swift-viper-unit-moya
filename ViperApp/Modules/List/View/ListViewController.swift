//
//  ListViewController.swift
//  ViperApp
//
//  Created by Oğulcan on 18.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var presenter: ViewToPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
}

extension ListViewController: PresenterToViewProtocol {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showError(with message: String?) {
        
    }
    
    func showItems(with items: [Codable]) {
        
    }
}
