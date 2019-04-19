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
    var listItems: [Actor] = []
    
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
        self.listItems = items as! [Actor]
        self.tableView.reloadData()
    }
}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(at: indexPath) as ListCell
        cell.set(for: self.listItems[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.showDetail(for: self.listItems[indexPath.row], navigation: self.navigationController!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
