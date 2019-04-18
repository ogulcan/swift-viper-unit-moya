//
//  ListInteractor.swift
//  ViperApp
//
//  Created by Oğulcan on 18.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation
import UIKit

class ListInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func retrieveList() {
        BaseService<TMDbApi, [Actor]>().call(.listActors(), completion: { actors in
            guard let actors = actors else {
                self.presenter?.retrieveFail(message: "")
                return
            }

            print("Actors size: \(actors.count)")
            //self.presenter?.retrieveSuccess(items: actors)
        })
    }
}
