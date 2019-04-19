//
//  SearchRouter.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation
import UIKit

class SearchRouter: PresenterToRouterSearchProtocol {
    
    static func createSearchModule() -> UINavigationController {
        let presenter: ViewToPresenterSearchProtocol & InteractorToPresenterSearchProtocol = SearchPresenter()
        let interactor: PresenterToInteractorSearchProtocol = SearchInteractor()
        let router: PresenterToRouterSearchProtocol = SearchRouter()
        
        let navigationController = SearchViewController.instantiateWithNavigation(from: .Main)
        let view = navigationController.viewControllers.first as! SearchViewController
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return navigationController
    }
    
    func close() {
        
    }
}
