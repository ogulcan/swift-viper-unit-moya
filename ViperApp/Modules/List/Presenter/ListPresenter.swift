//
//  ListPresenter.swift
//  ViperApp
//
//  Created by Oğulcan on 18.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation
import UIKit

class ListPresenter: ViewToPresenterProtocol {
    
    weak var view: PresenterToViewProtocol?
    var router: PresenterToRouterProtocol?
    var interactor: PresenterToInteractorProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveList()
    }
    
    func showDetail(for item: Codable, navigation: UINavigationController) {
        router?.pushDetail(with: item, to: navigation)
    }
    
    func showSearch() {
        router?.presentSearch()
    }
}

extension ListPresenter: InteractorToPresenterProtocol {
    
    func retrieveSuccess(items: [Codable]) {
        view?.hideLoading()
        view?.showItems(with: items)
    }
    
    func retrieveFail(message: String?) {
        view?.hideLoading()
        view?.showError(with: message)
    }
}
