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
        return ListViewController.instantiateWithNavigation(from: .Main)
    }
    
    func pushDetail(with item: Codable) {
        
    }
}
