//
//  SearchPresenter.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation
import UIKit

class SearchPresenter: ViewToPresenterSearchProtocol {
    
    var view: PresenterToViewSearchProtocol?
    var router: PresenterToRouterSearchProtocol?
    var interactor: PresenterToInteractorSearchProtocol?
    
    func viewDidLoad() {
        self.view?.showItems(with: [])
    }
    
    func textChanged(to text: String) {
        if (text.isEmpty) {
            self.view?.showItems(with: [])
        } else {
            self.interactor?.retrieveActor(with: text)
        }
    }
}

extension SearchPresenter: InteractorToPresenterSearchProtocol {
    
    func retrieveSuccess(items: [Codable]) {
        self.view?.showItems(with: items)
    }
    
    func retrieveFail(message: String?) {
        self.view?.showError(with: message)
    }
}
