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
        
    }
    
    func showDetail(for item: Codable) {
        
    }
}

extension ListPresenter: InteractorToPresenterProtocol {
    
    func retrieveSuccess(items: [Codable]) {
        
    }
    
    func retrieveFail(message: String?) {
        
    }
}
