//
//  ListProtocol.swift
//  ViperApp
//
//  Created by Oğulcan on 18.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation

protocol ViewToPresenterProtocol {
    
    func viewDidLoad()
    func showDetail(for item: Codable)
}

protocol PresenterToViewProtocol {
    
    func showLoading()
    func hideLoading()
    func showError(with message: String?)
    func showItems(with items: [Codable])
}
