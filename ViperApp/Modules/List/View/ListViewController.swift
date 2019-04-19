//
//  ListViewController.swift
//  ViperApp
//
//  Created by Oğulcan on 18.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import UIKit
import SVProgressHUD

class ListViewController: UIViewController {

    var presenter: ViewToPresenterProtocol?
    var listItems: [Actor] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationItem()
        self.presenter?.viewDidLoad()
    }
    
    private func addNavigationItem() {
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_search"), style: .plain, target: self, action: #selector(searchTapped))
        searchBarButtonItem.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = searchBarButtonItem
    }
    
    @objc func searchTapped() {
        self.presenter?.showSearch()
    }
}

extension ListViewController: PresenterToViewProtocol {
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showError(with message: String?) {
        SVProgressHUD.showError(withStatus: message ?? "An error occuredgş")
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
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.presenter?.showDetail(for: self.listItems[indexPath.row], navigation: self.navigationController!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
