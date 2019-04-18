//
//  ListProtocol.swift
//  ViperApp
//
//  Created by Oğulcan on 18.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {
    
    var view: PresenterToViewProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    
    func viewDidLoad()
    func showDetail(for item: Codable)
}

protocol PresenterToViewProtocol: class {
    
    func showLoading()
    func hideLoading()
    func showError(with message: String?)
    func showItems(with items: [Codable])
}

protocol PresenterToRouterProtocol: class {
    
    static func createListModule() -> UIViewController
    func pushDetail(with item: Codable)
}

protocol PresenterToInteractorProtocol: class {
    func retrieveList()
}

protocol InteractorToPresenterProtocol: class {
    func retrieveSuccess(items: [Codable])
    func retrieveFail(message: String?)
}