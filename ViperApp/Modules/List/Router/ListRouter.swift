//
//  ListRouter.swift
//  ViperApp
//
//  Created by Oğulcan on 18.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import UIKit

class ListRouter: PresenterToRouterProtocol {

    static func createListModule() -> UINavigationController {
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ListPresenter()
        let interactor: PresenterToInteractorProtocol = ListInteractor()
        let router: PresenterToRouterProtocol = ListRouter()
        
        let navigationController = ListViewController.instantiateWithNavigation(from: .Main)
        let view = navigationController.viewControllers.first as! ListViewController
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return navigationController
    }
    
    func pushDetail(with item: Codable) {
        
    }
}
