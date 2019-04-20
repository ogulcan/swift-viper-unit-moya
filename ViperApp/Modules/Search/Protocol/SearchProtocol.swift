//
//  SearchProtocol.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation

import UIKit

protocol ViewToPresenterSearchProtocol: class {
    
    var view: PresenterToViewSearchProtocol? { get set }
    var router: PresenterToRouterSearchProtocol? { get set }
    var interactor: PresenterToInteractorSearchProtocol? { get set }
    
    func viewDidLoad()
    func textChanged(to text: String)
}


protocol PresenterToViewSearchProtocol: class {
    
    func showLoading()
    func hideLoading()
    func showError(with message: String?)
    func showItems(with items: [Codable])
}


protocol PresenterToRouterSearchProtocol: class {
    
    static func createSearchModule() -> UINavigationController
    func close()
}

protocol PresenterToInteractorSearchProtocol: class {
    
    var presenter: InteractorToPresenterSearchProtocol? { get set }
    func retrieveActor(with p: String)
}

protocol InteractorToPresenterSearchProtocol: class {
    
    func retrieveSuccess(items: [Codable])
    func retrieveFail(message: String?)
}
