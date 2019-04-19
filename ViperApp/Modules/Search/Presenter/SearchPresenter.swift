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
        
    }
}

extension SearchPresenter: InteractorToPresenterSearchProtocol {
    
    func retrieveSuccess(items: [Codable]) {
        
    }
    
    func retrieveFail(message: String?) {
        
    }
}
